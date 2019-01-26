import 'package:meta/meta.dart';

@immutable
class ConnectionState {
  final String url;
  final int port;

  ConnectionState({this.url = "", this.port = 8080});
}
