import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shared_preferences/shared_preferences.dart';
import 'quran.dart';

class UserPage extends StatefulWidget {
  final User user;
  final int initialVerse;

  const UserPage({
    Key? key,
    required this.user,
    this.initialVerse = 0,
  }) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int? bookmarkedSurah;
  int? bookmarkedVerse;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadBookmark();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent * (widget.initialVerse / quran.getVerseCount(widget.user.surahNumber))
        );
      }
    });
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.surahName + ' | ' + widget.user.surahNameEnglish),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(.2),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: quran.getVerseCount(widget.user.surahNumber),
            itemBuilder: (context, index) {
              return ListTile(
                title: Card(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          _saveBookmark(widget.user.surahNumber, index + 1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: (bookmarkedSurah == widget.user.surahNumber && bookmarkedVerse == index +1)
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      (index == 0 && widget.user.surahNumber != 1)
                          ? Text(
                              quran.basmala,
                              style: TextStyle(fontSize: 25),
                            )
                          : Text(''),
                      SizedBox(height: 20),
                      Text(
                        quran.getVerse(widget.user.surahNumber, index + 1, verseEndSymbol: true),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        (index + 1).toString() +
                            '. ' +
                            quran.getVerseTranslation(widget.user.surahNumber, index + 1, verseEndSymbol: false),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
