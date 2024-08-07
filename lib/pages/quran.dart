import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shared_preferences/shared_preferences.dart';
import 'BackgroundContainer.dart';
import 'UserPage.dart';

class User {
  final String surahName;
  final int surahNumber;
  final String totalVerse;
  final String placeOfRevelation;
  final String surahNameEnglish;

  const User({
    required this.surahName,
    required this.surahNumber,
    required this.totalVerse,
    required this.placeOfRevelation,
    required this.surahNameEnglish,
  });
}

class rquran extends StatefulWidget {
  @override
  State<rquran> createState() => _rquranState();
}

class _rquranState extends State<rquran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: quranScrollable(),
    );
  }
}

class quranScrollable extends StatefulWidget {
  @override
  State<quranScrollable> createState() => quranScrollableState();
}

class quranScrollableState extends State<quranScrollable> {
  List<User> users = <User>[];
  int? bookmarkedSurah;
  int? bookmarkedVerse;

  @override
  void initState() {
    super.initState();
    _loadBookmark();
    for (int i = 1; i <= 114; i++) {
      User newUser = User(
        surahName: quran.getSurahNameArabic(i),
        surahNumber: i,
        totalVerse: quran.getVerseCount(i).toString(),
        placeOfRevelation: quran.getPlaceOfRevelation(i),
        surahNameEnglish: quran.getSurahNameEnglish(i),
      );
      users.add(newUser);
    }
  }

  _loadBookmark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bookmarkedSurah = prefs.getInt('bookmarkedSurah');
      bookmarkedVerse = prefs.getInt('bookmarkedVerse');
    });
  }

  _saveBookmark(int surahNumber, int verseNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bookmarkedSurah = surahNumber;
      bookmarkedVerse = verseNumber;
    });
    await prefs.setInt('bookmarkedSurah', surahNumber);
    await prefs.setInt('bookmarkedVerse', verseNumber);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      // Set the background color here
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];

                return Card(
                  color: Colors.transparent,
                  child: SizedBox(
                    width: 250,
                    height: 80,
                    child: ListTile(
                      title: Text(
                        '${user.surahNumber}. ${user.surahName} || ${user.surahNameEnglish}',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Total verses: ${user.totalVerse}  Place of Revelation: ${user.placeOfRevelation}'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserPage(user: user),
                        ));
                      },
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: TextButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    int? surahNumber = prefs.getInt('bookmarkedSurah');
                    int? verseNumber = prefs.getInt('bookmarkedVerse');

                    if (surahNumber != null && verseNumber != null) {
                      final user = users.firstWhere(
                          (user) => user.surahNumber == surahNumber);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            UserPage(user: user, initialVerse: verseNumber),
                      ));
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.bookmark,
                          color: bookmarkedSurah != null
                              ? Colors.amber
                              : Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
