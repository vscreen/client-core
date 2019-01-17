import '../generated/vscreen.pb.dart';

abstract class VScreenEvent {}

class Connect extends VScreenEvent {
  String url;
  int port;

  Connect(this.url, this.port);

  @override
  String toString() {
    return "connect";
  }
}

class Play extends VScreenEvent {
  @override
  String toString() {
    return "play";
  }
}

class Pause extends VScreenEvent {
  @override
  String toString() {
    return "pause";
  }
}

class Stop extends VScreenEvent {
  @override
  String toString() {
    return "stop";
  }
}

class Next extends VScreenEvent {
  @override
  String toString() {
    return "next";
  }
}

class Add extends VScreenEvent {
  String url;

  Add(this.url);

  @override
  String toString() {
    return "add";
  }
}

class Seek extends VScreenEvent {
  double position;

  Seek(this.position);

  @override
  String toString() {
    return "seek";
  }
}

class ServerUpdate extends VScreenEvent {
  @override
  String toString() {
    return "server_update";
  }
}
