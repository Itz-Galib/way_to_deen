import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'BackgroundContainer.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QiblaScrollable(),
    );
  }
}

class QiblaScrollable extends StatefulWidget {
  @override
  State<QiblaScrollable> createState() => QiblaScrollableState();
}

class QiblaScrollableState extends State<QiblaScrollable> {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder(
          stream: FlutterQiblah.qiblahStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ));
            }

            try {
              if (!snapshot.hasData || snapshot.data == null) {
                throw Exception("Qibla direction data is not available");
              }

              final qiblahDirection = snapshot.data;
              if (qiblahDirection?.qiblah == null ||
                  qiblahDirection?.direction == null) {
                throw Exception("Qibla direction data is invalid");
              }

              animation = Tween(
                      begin: begin,
                      end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                  .animate(_animationController!);
              begin = (qiblahDirection.qiblah * (pi / 180) * -1);
              _animationController!.forward(from: 0);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${qiblahDirection.direction.toInt()}°",
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 300,
                      child: AnimatedBuilder(
                        animation: animation!,
                        builder: (context, child) => Transform.rotate(
                          angle: animation!.value,
                          child: Image.asset('assets/qibla.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } catch (e) {
              String errorMessage = "An error occurred";

              if (e.toString().contains("No sensor found")) {
                errorMessage = "There is no sensor";
              } else if (e
                  .toString()
                  .contains("Qibla direction data is not available")) {
                errorMessage = "Qibla direction data is not available";
              } else if (e
                  .toString()
                  .contains("Qibla direction data is invalid")) {
                errorMessage = "Qibla direction data is invalid";
              }

              // Show toast message
              // _showToast(errorMessage);

              return Center(
                child: Text(
                  "Error: $errorMessage",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
