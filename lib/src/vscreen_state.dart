import 'package:meta/meta.dart';

@immutable
class Connection {
  final String url;
  final int port;

  Connection({@required this.url, @required this.port});
}

@immutable
class PlayerInfo {
  final String title;
  final String thumbnail;
  final bool playing;
  final double position;
  final double volume;

  PlayerInfo(
      {this.title = "video title",
      this.thumbnail = "",
      this.playing = false,
      this.position = 0.0,
      this.volume = 0.0});
}
