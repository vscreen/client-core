import '../model/vscreen_client_core.dart';

class VScreenState {
  static final VScreenState _instance = VScreenState._();

  VScreen _vscreen;
  String url;
  int port;

  bool hasError;
  String errorReason;

  VScreenState._();

  factory VScreenState.inital() {
    // TODO! Replace with more suitable default values
    _instance._vscreen = null;
    _instance.url = "";
    _instance.port = 8080;
    _instance.hasError = false;
    _instance.errorReason = "";

    return _instance;
  }

  void dispose() {
    if (_vscreen != null) {
      _vscreen.close();
    }
  }

  void connect(String url, int port) async {
    if (_vscreen != null) {
      _vscreen.close();
    }

    _vscreen = VScreen(url, port);
    // TODO!
    // _vscreen.subscribe();
  }

  void play() async {
    if (_vscreen != null) {
      await _vscreen.play();
    }
  }

  void pause() async {
    if (_vscreen != null) {
      await _vscreen.pause();
    }
  }

  void stop() async {
    if (_vscreen != null) {
      await _vscreen.stop();
    }
  }

  void next() async {
    if (_vscreen != null) {
      await _vscreen.next();
    }
  }

  void add(String url) async {
    if (_vscreen != null) {
      await _vscreen.add(url);
    }
  }

  void seek(double position) async {
    if (_vscreen != null) {
      await _vscreen.seek(position);
    }
  }
}
