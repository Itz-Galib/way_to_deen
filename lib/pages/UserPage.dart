import 'package:flutter/material.dart';
import 'home.dart';
import 'package:quran/quran.dart' as quran;
import 'package:waytodeen2/themes/theme_provider.dart';
import 'quran.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({
    Key? key,
    required this.user,
}): super(key:key);


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(user.surahName+' | '+user.surahNameEnglish),
        ),
        body: SafeArea(
          child: Padding(

            padding: EdgeInsets.all(.2),
            child: ListView.builder(

              itemCount: quran.getVerseCount(user.surahNumber),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                    child: Column(
                      children:[
                       ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.transparent,
                              foregroundColor: Colors.black,
                              elevation: 0,
                             ),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                               children: const [
                                
                                Icon(Icons.bookmark),
                              ],
                                ),
                    ),
                        (index==0&&user.surahNumber!=1)
                            ? Text(
                            quran.basmala,
                          style: TextStyle(fontSize: 25),
                        ) : Text(''),
                        SizedBox(height: 20,),
                        Text(
                          quran.getVerse(user.surahNumber, index + 1, verseEndSymbol: true),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                         ),
                        Text(
                        (index+1).toString()+'. '+quran.getVerseTranslation(user.surahNumber, index + 1, verseEndSymbol: false),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),),
                        SizedBox(height: 20,),
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
