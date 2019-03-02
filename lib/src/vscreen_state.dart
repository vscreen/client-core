import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

@immutable
abstract class ConnectionState {}

@immutable
class Connection {
  final String host;
  final int port;

  Connection({@required this.host, @required this.port});
  bool operator ==(other) =>
      other is Connection && host == other.host && port == other.port;

  int get hashCode => hash2(host.hashCode, port.hashCode);
}

class Discovered extends ConnectionState {
  final Set<Connection> services;

  Discovered({@required this.services});
}

class Discovering extends ConnectionState {}

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

  NewPlayerInfo(
      {this.title = "video title",
      this.thumbnail = "",
      this.playing = false,
      this.position = 0.0,
      this.volume = 0.0});
}
