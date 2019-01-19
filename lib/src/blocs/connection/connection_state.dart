import 'package:meta/meta.dart';

@immutable
class ConnectionState {
  final String url;
  final int port;

  ConnectionState({this.url = "127.0.0.1", this.port = 8080});
}
