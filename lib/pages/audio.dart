//import 'dart:ui_web';

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'song.dart';

import 'playlistProvider.dart';
import 'sura_page.dart';

import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import 'Songs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _audioState();
}

class _audioState extends State<audio> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuraPage(),
      ),
    );
  }


  //String progressText="Not Downloaded";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("P L A Y L I S T")),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        //get the playlist

        //return listview ui
        return ListView.builder(
            itemCount: Songs.playlist.length,
            itemBuilder: (contex, index) {
              //get individual sura
              final Song sura = Songs.playlist[index];
              final bool isPlaying = index == playlistProvider.currentSongIndex;
              //double? _progress=0;
              return Card(
                color: isPlaying ? Colors.blue.withOpacity(0.3) : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      height: 80,
                      child: ListTile(
                        title: Text(sura.suraName,style: TextStyle(fontSize: 20),),
                        subtitle: Text(sura.artistname,style: TextStyle(fontSize: 17),),
                        onTap: () => goToSong(index),

                      ),
                    ),
                   
                    TextButton(
                      onPressed: (){
                        if(!Songs.playlist[index].isDownloaded) {
                          String url = Songs.playlist[index].audioPath;
                          print(url);
                          FileDownloader.downloadFile(url: url.trim(),
                              downloadDestination: DownloadDestinations.appFiles,
                              /*
                              onProgress: (name, progress) {
                                setState(() {
                               //   _progress = progress;
                                 // progressText = _progress.toString();
                                  //print(_progress);
                                });
                              },
                              */
                              onDownloadCompleted: (value) async {
                                print(value);
                                Songs.playlist[index].audioPath1=value;
                                Songs.playlist[index].isDownloaded=true;

                                var sharedPref = await SharedPreferences.getInstance();
                                sharedPref.setString(playlistProvider.temp, value);
                              },
                              onDownloadError: (error) {
                                print(error);
                              }
                          );
                        }

                      },
                      child: const Icon(
                        Icons.download,
                      ),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}

/*
Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> UserPage(user: user),
                ));*/
///storage/emulated/0/Android/data/com.example.waytodeen2/files/data/user/0/com.example.waytodeen2/files/2_Al-Baqara-1.mp3