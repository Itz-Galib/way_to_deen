class Song {
  final String suraName;
  final String artistname;
  final String audioPath;
  String audioPath1 = "";
  bool isDownloaded = false;

  Song({
    required this.suraName,
    required this.artistname,
    required this.audioPath,
  });
}
