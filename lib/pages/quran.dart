import 'package:flutter/material.dart';
//import 'square.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shared_preferences/shared_preferences.dart';
import 'UserPage.dart';
import 'package:waytodeen2/themes/theme_provider.dart';

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
  List<User> users = <User>[];

  Widget build(BuildContext context) {
    for (int i = 1; i <= 114; i++) {
      User newUser = User(
          surahName: quran.getSurahNameArabic(i),
          surahNumber: i,
          totalVerse: quran.getVerseCount(i).toString(),
          placeOfRevelation: quran.getPlaceOfRevelation(i),
          surahNameEnglish: quran.getSurahNameEnglish(i));
      users.add(newUser);
    }
    return Scaffold(
        body: Stack(
      children: [
      
        
        ListView.builder(
        
         // shrinkWrap: mounted,
          padding: const EdgeInsets.all(8),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
        
            return Card(
              child: ListTile(
                title: Text(user.surahNumber.toString() +
                    '. ' +
                    user.surahName +
                    '  ||  ' +
                    user.surahNameEnglish),
                subtitle: Text('Total verses: ' +
                    user.totalVerse +
                    '  Place of Revelation :' +
                    user.placeOfRevelation),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserPage(user: user),
                  ));
                },
              ),
            );
          },
        ),
        


        /// new button
         Container(
       
        alignment:  Alignment(0, 0.75),
          child:
              Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 mainAxisAlignment: MainAxisAlignment.end,
                
                 children: [
                  
            Container(
               //padding: const EdgeInsets.all(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                width: MediaQuery.of(context).size.width * .12,
                child: TextButton(
                  
                    onPressed: () async {
                      var sharedPref = await SharedPreferences.getInstance();
                      //  sharedPref.setBool(splashState.KeyPressed, true);
                      //  Navigator.pushReplacement(context,
                      //       MaterialPageRoute(builder: (context) => HiddenDrawer()));
                    },
                    child: Row(
                      children: [
                       Icon(Icons.bookmark,color: Colors.amber),
                      /* Text(
                          'Last Read',
                          style: TextStyle(color: Colors.white,fontSize: 10),
                        ),
                        */
                      ],
                    )
                    ))
          ]),
        ),
        
      ],
    ) 

        );
  }
}
