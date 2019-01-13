import 'package:web_socket_channel/io.dart';
import 'dart:convert';

class Operation {
  static const int auth = 0;
  static const int play = 1;
  static const int pause = 2;
  static const int stop = 3;
  static const int next = 4;
  static const int add = 5;
  static const int seek = 6;
}

enum Status { none }

class VScreen {
  final String url;
  final int port;
  IOWebSocketChannel channel;

  VScreen(
    this.url,
    this.port, {
    void Function(Status status) authCallback,
    void Function(Status status) playCallback,
    void Function(Status status) pauseCallback,
    void Function(Status status) stopCallback,
    void Function(Status status) nextCallback,
    void Function(Status status) addCallback,
    void Function(Status status) seekCallback,
  }) {
    channel = IOWebSocketChannel.connect('ws://$url:$port');
    channel.stream.listen((data) {
      Map<String, dynamic> resp = json.decode(data);
      Status status = resp["status"];

      switch (resp["operation"]) {
        case Operation.auth:
          authCallback(status);
          break;
        case Operation.play:
          playCallback(status);
          break;
        case Operation.pause:
          pauseCallback(status);
          break;
        case Operation.stop:
          stopCallback(status);
          break;
        case Operation.next:
          nextCallback(status);
          break;
        case Operation.add:
          addCallback(status);
          break;
        case Operation.seek:
          seekCallback(status);
          break;
      }
    });
  }

  void dispose() {
    this.channel.sink.close();
  }

  void _send(Map<String, dynamic> request) {
    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }

  void auth(String password) {
    var request = {
      "operation": Operation.auth,
      "version": "0.1.0",
      "password": password
    };

    _send(request);
  }

  void play() {
    var request = {"operation": Operation.play};
    _send(request);
  }

  void pause() {
    var request = {"operation": Operation.pause};
    _send(request);
  }

  void stop() {
    var request = {"operation": Operation.stop};
    _send(request);
  }

  void next() {
    var request = {"operation": Operation.next};
    _send(request);
  }

  void add(String url) {
    var request = {"operation": Operation.add, "url": url};
    _send(request);
  }

  void seek(double position) {
    var request = {"operation": Operation.seek, "position": position};
    _send(request);
  }
}
