abstract class VScreenEvent {}

class Connect extends VScreenEvent {
  String url;
  int port;

  Connect(this.url, this.port);
}

class Play extends VScreenEvent {}

class Pause extends VScreenEvent {}

class Stop extends VScreenEvent {}

class Next extends VScreenEvent {}

class Add extends VScreenEvent {
  String url;

  Add(this.url);
}

class Seek extends VScreenEvent {
  double position;

  Seek(this.position);
}
