import '../model/vscreen_client_core.dart';

class VScreenState {
  static final VScreenState _instance = VScreenState._();

  String url;
  int port;
  String title;
  String thumbnailURL;
  bool isPlaying;
  double position;
  double volume;

  String errorReason;

  VScreenState._();

  factory VScreenState.inital(
      {String url = "",
      int port = 8080,
      String errorReason = "",
      String title = "video title",
      String thumbnailURL = "",
      bool isPlaying = false,
      double position = 0.0,
      double volume = 0.0}) {
    // TODO! Replace with more suitable default values
    _instance.url = url;
    _instance.port = port;
    _instance.errorReason = errorReason;
    _instance.title = title;
    _instance.thumbnailURL = thumbnailURL;
    _instance.isPlaying = isPlaying;
    _instance.position = position;
    _instance.volume = volume;

    return _instance;
  }
}
