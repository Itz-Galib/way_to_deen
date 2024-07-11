import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:waytodeen2/pages/playlistProvider.dart';
import 'package:waytodeen2/splash.dart';
import 'package:provider/provider.dart';
import 'package:waytodeen2/themes/theme_provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (hasPermission) {
            return const splash();
          } else {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Text(
                'Pleas allow the permission for accessing location ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
        future: getPermission(),
      ),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
