
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waytodeen2/onboarding_screens/intro1.dart';
import 'package:waytodeen2/onboarding_screens/intro2.dart';
import 'package:waytodeen2/onboarding_screens/intro3.dart';
import 'package:waytodeen2/onboarding_screens/intro4.dart';
import 'package:waytodeen2/onboarding_screens/intro5.dart';
import 'package:waytodeen2/onboarding_screens/intro6.dart';
import 'package:waytodeen2/onboarding_screens/intro7.dart';
import 'package:waytodeen2/pages/hidden_drawer.dart';
import 'package:waytodeen2/splash.dart';




class onBoard extends StatefulWidget {
  const onBoard({Key? key}) : super(key: key);

  @override
  State<onBoard> createState() => _onBoardState();
}



class _onBoardState extends State<onBoard> {
  PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
   bool onLastpage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //pages
          PageView(
            controller: _controller,
            onPageChanged: (index){
             setState(() {
               onLastpage=(index==6);
             });
            },
            children: [
              intro1(),
              intro2(),
              intro3(),
              intro4(),
              intro5(),
              intro6(),
              intro7(),
            ],
          ),

          //dot indicator
          onLastpage?getStarted():
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                
                GestureDetector(
                  child: Text('Skip', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
                  onTap: () {
                  _controller.jumpToPage(6);
                  },
                ),
                SmoothPageIndicator(
                  controller: _controller, count: 7,
                  effect: SwapEffect(
                    activeDotColor:Colors.black,
                    dotColor: Colors.red,
                    dotHeight: 15,
                    dotWidth: 15 ),
                  ),

                //next
                
                onLastpage
                ?/*GestureDetector(
                  child: Text('LessGo',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context){
                      return HiddenDrawer();
                    }));
                    
                  },
                )*/getStarted():
                GestureDetector(
                  child: Text('Next',style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
                  onTap: () {
                    _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    
  }
    Widget getStarted(){
     return Container(
      alignment: Alignment(0, 0.75),
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
       Container(
        
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        
        color: Colors.green),
      width: MediaQuery.of(context).size.width*.9,
       child: TextButton( 
             onPressed: ()async{
               var sharedPref = await SharedPreferences.getInstance();
               sharedPref.setBool( splashState.KeyPressed, true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HiddenDrawer()));
              },
       child:Text('Get Started',style: TextStyle(color: Colors.white
       ),
       )
       )
       )
      ]
      
      ),

      
     );
     }

}

