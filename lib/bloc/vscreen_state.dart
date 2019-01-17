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

  factory VScreenState.inital() {
    // TODO! Replace with more suitable default values
    _instance.url = "";
    _instance.port = 8080;
    _instance.errorReason = "";
    _instance.title = "video title";
    _instance.thumbnailURL = "";
    _instance.isPlaying = false;
    _instance.position = 0.0;
    _instance.volume = 0.0;

    return _instance;
  }
}
