import 'package:meta/meta.dart';

abstract class ConnectionEvent {}

@immutable
class Connect extends ConnectionEvent {
  final String url;
  final int port;

  Connect({this.url = "127.0.0.1", this.port = 8080});

  @override
  String toString() {
    return 'connect';
  }
}
