import 'package:meta/meta.dart';

abstract class ConnectionEvent {}

@immutable
class Connect extends ConnectionEvent {
  final String url;
  final int port;

  Connect({this.url = "", this.port = 8080});

  @override
  String toString() {
    return 'connect';
  }
}
