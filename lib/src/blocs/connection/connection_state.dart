import 'package:meta/meta.dart';

abstract class ConnectionState {}

@immutable
class NewConnection extends ConnectionState {
  final String url;
  final int port;

  NewConnection({@required this.url, @required this.port});
}

@immutable
class Connecting extends ConnectionState {
  Connecting();
}

@immutable
class ConnectionFailed extends ConnectionState {
  final String reason;

  ConnectionFailed({@required this.reason});
}
