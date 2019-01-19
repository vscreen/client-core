import 'package:meta/meta.dart';

@immutable
abstract class PlayerEvent {}

class Play extends PlayerEvent {
  @override
  String toString() {
    return "play";
  }
}

class Pause extends PlayerEvent {
  @override
  String toString() {
    return "pause";
  }
}

class Stop extends PlayerEvent {
  @override
  String toString() {
    return "stop";
  }
}

class Next extends PlayerEvent {
  @override
  String toString() {
    return "next";
  }
}

class Add extends PlayerEvent {
  final String url;

  Add(this.url);

  @override
  String toString() {
    return "add";
  }
}

class Seek extends PlayerEvent {
  final double position;

  Seek(this.position);

  @override
  String toString() {
    return "seek";
  }
}
