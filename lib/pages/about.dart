import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waytodeen2/pages/BackgroundContainer.dart';

class about_page extends StatefulWidget {
  const about_page({Key? key}) : super(key: key);

  @override
  State<about_page> createState() => _about_pageState();
}

class _about_pageState extends State<about_page> {
  // Default color
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AboutScrollable(),
    );
  }
}


class AboutScrollable extends StatefulWidget {
  @override
  State<AboutScrollable> createState() => AboutScrollableState();
}

class AboutScrollableState extends State<AboutScrollable> {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 55,
                  width: 500,
                  child: Text(
                    'If you face any problem please feel free to Contact any of us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Nur Mohammad Kazi',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        launchButton(
                          title: 'Nur',
                          icon: Icons.email,
                          onPressed: () async {
                            Uri uri = Uri.parse(
                              'mailto:nurmohammadkazi2002@gmail.com?subject=Flutter Url Launcher&body=Hi,Flutter developer',
                            );
                            if (!await launchUrl(uri)) {
                              debugPrint('could not launch the Uri');
                            }
                          },
                        ),
                        launchButton(
                          title: 'Nur',
                          icon: Icons.facebook,
                          onPressed: () {
                            launch(
                              'https://www.facebook.com/profile.php?id=100082402681024&mibextid=ZbWKwL',
                              forceWebView: true,
                              forceSafariVC: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Md. Luthful Hasan Galib',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        launchButton(
                          title: 'Galib',
                          icon: Icons.email,
                          onPressed: () async {
                            Uri uri = Uri.parse(
                              'mailto:luthfulomi@gmail.com?subject=Flutter Url Launcher&body=Hi,Flutter developer',
                            );
                            if (!await launchUrl(uri)) {
                              debugPrint('could not launch the Uri');
                            }
                          },
                        ),
                        launchButton(
                          title: 'Galib',
                          icon: Icons.facebook,
                          onPressed: () {
                            launch(
                              'https://www.facebook.com/omi.hasan.562114',
                              forceWebView: true,
                              forceSafariVC: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Ali Faruk Shihab',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        launchButton(
                          title: 'Shihab',
                          icon: Icons.email,
                          onPressed: () async {
                            Uri uri = Uri.parse(
                              'mailto:faruk.cse.20210204088@aust.edu?subject=Flutter Url Launcher&body=Hi,Flutter developer',
                            );
                            if (!await launchUrl(uri)) {
                              debugPrint('could not launch the Uri');
                            }
                          },
                        ),
                        launchButton(
                          title: 'Shihab',
                          icon: Icons.facebook,
                          onPressed: () {
                            launch(
                              'https://www.facebook.com/ali.faruk.10048?mibextid=ZbWKwL',
                              forceWebView: true,
                              forceSafariVC: false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget launchButton({
    required String title,
    required IconData icon,
    required Function() onPressed,
  }) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
