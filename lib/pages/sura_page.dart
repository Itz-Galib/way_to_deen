import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waytodeen2/pages/playlistProvider.dart';
import 'neu_box.dart';
import 'Songs.dart';


class SuraPage extends StatelessWidget {
  //double _sliderValue = 0.0;
   SuraPage({super.key});
   // converting  duration  into minit and seconds
   String formatTime(Duration duration){
    String twoDigitSeconds =duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    String formattedTime ="${duration.inMinutes}:$twoDigitSeconds";
   return formattedTime;
   }

  // double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context,value,child){
      //get playlist
      //final playlist =value.playlist;

      //get current sura

      final currentSong =Songs.playlist[value.currentSongIndex ?? 0];


        //returning sura player ui
      return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
     
      body: SafeArea(
        child: Padding(
          
          padding:  EdgeInsets.only(left: 25,right: 25,bottom: 25),
          child: Column(
          
            children: [
              
               //appbar
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //backbutton
                IconButton(onPressed :()=>Navigator.pop(context),
                icon:Icon(Icons.arrow_back ),
                ),
                //title
                Text("PLAYLIST",style: TextStyle(letterSpacing: 3),),
                //menubutton
                IconButton(onPressed :()=>Navigator.pop(context),
                icon:Icon(Icons.menu),
                ),
                ],
          
         
                    
        ),

       // SizedBox(height: 50,),
             
               //image or sura name
               NeuBox(
                
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(8),      
                ),
                //sora name
                Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Column(children: [
                      Text(currentSong.suraName,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  
                      Text(currentSong.artistname),
                     ],
                     ),
                     
                  ],),
                )

               ],
               ),
               
               ),
                

               //song duration


               const SizedBox(height: 25,),
               Column(
              
                 children: [
                    Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 25.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                    
                        children: [
                          
                          //start tiem
                           Text(formatTime(value.currentDuration)),
                     
                        
                         
                     
                          ///end time
                          Text(formatTime(value.totalDuration)),
                        ],
                      ),
                   ),
                   SizedBox(height: 25,),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                      const  RoundSliderThumbShape(enabledThumbRadius: 0,),
                    ) ,
                    child: Slider(
                                     min: 0,
                                     max: value.totalDuration.inSeconds.toDouble(),
                                    value: value.currentDuration.inSeconds.toDouble(),
                                    activeColor: Colors.green,
                                   onChanged: (double double) {
                                    //duration  when uses the slider

                                   },
                                   onChangeEnd: ( double double) {
                                    //sliding has finished, go to the sora position
                                     value.seek(Duration(seconds: double.toInt()));
                                    
                                   },
          

                         ),
                  ),
                 ],
               ),
              SizedBox(height: 25,),
              Row(
                children: [
                  // skip prev
                  Expanded(
                    child: GestureDetector(
                      onTap:value.playPreviousSong,
                      
                      child: NeuBox
                      (
                        child: Icon(Icons.skip_previous),
                      ),
                    )
                    ),

                       const SizedBox(width: 20,),
                       //play pause
                    Expanded(
                      flex: 2,
                    child: GestureDetector(
                      onTap: value.pauseOrResume,
                      child: NeuBox
                      (
                        child: Icon(value.isPlaying ? Icons.pause:Icons.play_arrow),
                      ),
                    )
                    ),
                     const SizedBox(width: 20,),
                     // skip forward
                    Expanded(
                    child: GestureDetector(
                      onTap: value.playNextSong,
                      child: NeuBox
                      (
                        child: Icon(Icons.skip_next),
                      ),
                    )
                    ),

                ],
              )

               //playback controls

          
          ],),
        ),
      )
    );
    },
    );
  }
}
