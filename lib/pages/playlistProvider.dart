import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'audio.dart';
import 'song.dart';
import 'Songs.dart';
import 'package:waytodeen2/pages/Songs.dart';
import 'package:shared_preferences/shared_preferences.dart';


 class PlaylistProvider extends ChangeNotifier{

  int ? current1index;

  
   //audio players 
   final AudioPlayer _audioPlayer =AudioPlayer();

   String temp="";

  //durations
          Duration _currentDuration = Duration.zero;
          Duration _totalDuration = Duration.zero;

  //constructor
   PlaylistProvider(){
    listenToDuartion();
   }
  ///initially not playing
     bool _isPlaying =false;

   void updateAudio1(value){
     Songs.playlist[current1index!].audioPath1=value;
     Songs.playlist[current1index!].audioPath1=value;
   }

  ///play the current sura
    void play()async{
      var sharedPref = await SharedPreferences.getInstance();
      var path1=sharedPref.getString(temp);
      print(path1);
      Songs.playlist[current1index!].audioPath1=path1.toString();
      if(Songs.playlist[current1index!].audioPath1=="")Songs.playlist[current1index!].isDownloaded=false;
      else Songs.playlist[current1index!].isDownloaded=true;
      final String path;
      if(!Songs.playlist[current1index!].isDownloaded)path=Songs.playlist[current1index!].audioPath;
      else path=Songs.playlist[current1index!].audioPath1;
      print(path);
      print(Songs.playlist[current1index!].audioPath1);
      await _audioPlayer.stop();//stop current sura
      ///errorrrrr
      if(!Songs.playlist[current1index!].isDownloaded)await _audioPlayer.play(UrlSource(path));
      else await _audioPlayer.play(DeviceFileSource(path));
      _isPlaying =true;
     notifyListeners();

    }
  ///pause current sura
    
    void pause()async{
      await _audioPlayer.pause();
      _isPlaying =false;
      notifyListeners();
    }

  ///resume playing
  void resume ()async{
    await _audioPlayer.resume();
    _isPlaying =true;
    notifyListeners();
  }
  ///pause or resume
    
    void pauseOrResume()async {
      if(_isPlaying){
        pause();
      }
      else{
       resume();

      }
      notifyListeners();
    }

  ///seek to specifiq position
   void seek(Duration position)async{
    await _audioPlayer.seek(position);
   }


  ///play next sora
  void playNextSong(){
    ///
    // eikhane amader vul hoar possibility ache
    //
    if(current1index!=null){
       if(current1index!<Songs.playlist.length-1){
        //go to the next song if its not the last song
        currentSongIndex = current1index!+1;

       }
       else{
        //if its the last song
        currentSongIndex=0;
       }
    }
  }
  ///play previous sora
  

  void playPreviousSong()async{
    //if more then 2 seconds have passed ,restart the current song
    if (_currentDuration.inSeconds>2){
          
       seek(Duration.zero);
    }
    //if its wuthn the 2 seconds
    else{
        if(current1index!>0)
        {
          currentSongIndex = current1index!-1;

        }else{
          //if its first song,loop back to last song
          currentSongIndex =Songs.playlist.length-1;

        }

    }
  }
  /// listen to duration
      void listenToDuartion(){
        //listen for total duration
        _audioPlayer.onDurationChanged.listen((newDuration){
          _totalDuration = newDuration;
          notifyListeners();
        });
        //listen for current duration
         _audioPlayer.onPositionChanged.listen((newPosition) {
            _currentDuration =newPosition;
            notifyListeners();
          });

        //listen for song completion
        _audioPlayer.onPlayerComplete.listen((event){
          playNextSong();
        });
      }
  /// dispose audio player
  
  //ekhaner ta katbi

  //getters
   List<Song>get playlist=>playlist;
   int ? get currentSongIndex => current1index;
  bool get isPlaying =>_isPlaying;
  Duration get currentDuration =>_currentDuration;
  Duration get totalDuration=>_totalDuration;
   //seters
   set currentSongIndex(int ?newIndex){
    current1index = newIndex;
    if(newIndex!=null){
      play();
    }

    notifyListeners();

   }

 }