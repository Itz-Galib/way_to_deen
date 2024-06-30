import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:waytodeen2/pages/about.dart';
import 'package:waytodeen2/pages/audio.dart';
import 'package:waytodeen2/pages/calendartable.dart';
import 'package:waytodeen2/pages/home.dart';
import 'package:waytodeen2/pages/qiblah_screen.dart';
import 'package:waytodeen2/pages/quran.dart';
import 'package:waytodeen2/pages/settings.dart';
import 'package:waytodeen2/pages/tazbihcounter.dart';

//import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';
class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => __HiddenDrawerState();
}

class __HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Prayer Times',
            baseStyle: TextStyle(
              color: Colors.black,
            ),
            selectedStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Home()),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Read Quran',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        rquran(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Qibla',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        QiblahScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Tazbih',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        tazbihcounter(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Audio Quran',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Audio(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Calendar',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        calendartable(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Settings',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        settings(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'About Us',
          baseStyle: TextStyle(color: Colors.black),
          selectedStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        about_page(),
      ),
    ];
  }

  //edited
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom app bar here
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: HiddenDrawerMenu(
          backgroundColorMenu: Colors.green.shade200,
          screens: _pages,
          initPositionSelected: 0,
        ),
      ),
    );
  }
}
