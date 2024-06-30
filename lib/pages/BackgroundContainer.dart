import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  const BackgroundContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.1, // Adjust the opacity to your liking
            child: Image.asset(
              'assets/background2.jpg', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
