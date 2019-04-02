import 'package:meta/meta.dart';

@immutable
abstract class ConnectionState {}

class Connected extends ConnectionState {
  final String url;
  final int port;

  Connected({@required this.url, @required this.port});
}

class Connecting extends ConnectionState {}

class Disconnected extends ConnectionState {}

@immutable
abstract class PlayerState {}

class NewPlayerInfo extends PlayerState {
  final String title;
  final String thumbnail;
  final bool playing;
  final double position;
  final double volume;
  final int duration;

  NewPlayerInfo(
      {this.title = "video title",
      this.thumbnail = "",
      this.playing = false,
      this.position = 0.0,
      this.volume = 0.0,
      this.duration = 0});
}
