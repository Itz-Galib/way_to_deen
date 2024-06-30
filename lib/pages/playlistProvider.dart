import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'song.dart';
import 'Songs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaylistProvider extends ChangeNotifier {
  int? current1index;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  // Constructor
  PlaylistProvider() {
    listenToDuration();
    loadDownloadedSongs();
  }

  void updateAudioPath(int index, String value) {
    Songs.playlist[index].audioPath1 = value;
    Songs.playlist[index].isDownloaded = true;
    saveDownloadedSongs();
  }

  Future<void> loadDownloadedSongs() async {
    var sharedPref = await SharedPreferences.getInstance();
    for (int i = 0; i < Songs.playlist.length; i++) {
      String? path = sharedPref.getString('sura_${i}_path');
      if (path != null && path.isNotEmpty) {
        Songs.playlist[i].audioPath1 = path;
        Songs.playlist[i].isDownloaded = true;
      }
    }
    notifyListeners();
  }

  Future<void> saveDownloadedSongs() async {
    var sharedPref = await SharedPreferences.getInstance();
    for (int i = 0; i < Songs.playlist.length; i++) {
      if (Songs.playlist[i].isDownloaded) {
        sharedPref.setString('sura_${i}_path', Songs.playlist[i].audioPath1);
      } else {
        sharedPref.remove('sura_${i}_path');
      }
    }
  }

  Future<void> play() async {
    if (current1index == null) return;

    final currentSong = Songs.playlist[current1index!];
    final String path = currentSong.isDownloaded
        ? currentSong.audioPath1
        : currentSong.audioPath;

    print('Playing song: ${currentSong.suraName}');
    print('Path: $path');
    print('Is Downloaded: ${currentSong.isDownloaded}');

    await _audioPlayer.stop();
    try {
      if (currentSong.isDownloaded) {
        await _audioPlayer.play(DeviceFileSource(path));
      } else {
        await _audioPlayer.play(UrlSource(path));
      }
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  Future<void> pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNextSong() {
    if (current1index != null) {
      currentSongIndex = (current1index! + 1) % Songs.playlist.length;
    }
  }

  Future<void> playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (current1index != null) {
        currentSongIndex = (current1index! - 1 + Songs.playlist.length) %
            Songs.playlist.length;
      }
    }
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  List<Song> get playlist => Songs.playlist;
  int? get currentSongIndex => current1index;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    current1index = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }
}
