/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waytodeen2/pages/song.dart';
import 'playlistProvider.dart';
import 'sura_page.dart';
import 'Songs.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Audio extends StatefulWidget {
  const Audio({super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  late PlaylistProvider playlistProvider;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: Songs.playlist.length,
            itemBuilder: (context, index) {
              final Song sura = Songs.playlist[index];
              final bool isPlaying = index == playlistProvider.currentSongIndex;

              return Card(
                color: isPlaying ? Colors.blue.withOpacity(0.3) : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      height: 80,
                      child: ListTile(
                        title: Text(
                          sura.suraName,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          sura.artistname,
                          style: TextStyle(fontSize: 17),
                        ),
                        onTap: () => goToSong(index),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (!sura.isDownloaded) {
                          String url = sura.audioPath;
                          FileDownloader.downloadFile(
                            url: url.trim(),
                            downloadDestination: DownloadDestinations.appFiles,
                            onDownloadCompleted: (value) async {
                              playlistProvider.updateAudioPath(index, value);
                              setState(() {});
                            },
                            onDownloadError: (error) {
                              print(error);
                            },
                          );
                        }
                      },
                      child: Icon(
                        sura.isDownloaded ? Icons.check : Icons.download,
                        color: sura.isDownloaded ? Colors.green : null,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waytodeen2/pages/BackgroundContainer.dart';
import 'package:waytodeen2/pages/song.dart';
import 'playlistProvider.dart';
import 'sura_page.dart';
import 'Songs.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class Audio extends StatefulWidget {
  const Audio({super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: audioScrollable(),
    );
  }
}

class audioScrollable extends StatefulWidget {
  @override
  State<audioScrollable> createState() => audioScrollableState();
}

class audioScrollableState extends State<audioScrollable> {
  late PlaylistProvider playlistProvider;

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

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: Songs.playlist.length,
            itemBuilder: (context, index) {
              final Song sura = Songs.playlist[index];
              final bool isPlaying = index == playlistProvider.currentSongIndex;

              return Card(
                color: isPlaying
                    ? Colors.blue.withOpacity(0.3)
                    : Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      height: 80,
                      child: ListTile(
                        title: Text(
                          sura.suraName,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          sura.artistname,
                          style: TextStyle(fontSize: 17),
                        ),
                        onTap: () => goToSong(index),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (!sura.isDownloaded) {
                          String url = sura.audioPath;
                          FileDownloader.downloadFile(
                            url: url.trim(),
                            downloadDestination: DownloadDestinations.appFiles,
                            onDownloadCompleted: (value) async {
                              playlistProvider.updateAudioPath(index, value);
                              setState(() {});
                            },
                            onDownloadError: (error) {
                              print(error);
                            },
                          );
                        }
                      },
                      child: Icon(
                        sura.isDownloaded ? Icons.check : Icons.download,
                        color: sura.isDownloaded
                            ? Colors.green
                            : Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    ));
  }

  /* late PlaylistProvider playlistProvider;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: Songs.playlist.length,
            itemBuilder: (context, index) {
              final Song sura = Songs.playlist[index];
              final bool isPlaying = index == playlistProvider.currentSongIndex;

              return Card(
                color: isPlaying ? Colors.blue.withOpacity(0.3) : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      height: 80,
                      child: ListTile(
                        title: Text(
                          sura.suraName,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          sura.artistname,
                          style: TextStyle(fontSize: 17),
                        ),
                        onTap: () => goToSong(index),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (!sura.isDownloaded) {
                          String url = sura.audioPath;
                          FileDownloader.downloadFile(
                            url: url.trim(),
                            downloadDestination: DownloadDestinations.appFiles,
                            onDownloadCompleted: (value) async {
                              playlistProvider.updateAudioPath(index, value);
                              setState(() {});
                            },
                            onDownloadError: (error) {
                              print(error);
                            },
                          );
                        }
                      },
                      child: Icon(
                        sura.isDownloaded ? Icons.check : Icons.download,
                        color: sura.isDownloaded ? Colors.green : null,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
  */
}
