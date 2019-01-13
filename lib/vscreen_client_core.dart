import 'package:web_socket_channel/io.dart';
import 'dart:convert';

class Operation {
  static const int auth = 0;
  static const int play = 1;
  static const int pause = 2;
  static const int next = 3;
  static const int add = 4;
  static const int seek = 5;
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

  void auth(String password) {
    var request = {
      "operation": Operation.auth,
      "version": "0.1.0",
      "password": password
    };

    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }

  void play() {
    var request = {"operation": Operation.play};

    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }

  void pause() {
    var request = {"operation": Operation.pause};

    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }

  void next() {
    var request = {"operation": Operation.next};

    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }

  void add(String url) {
    var request = {"operation": Operation.add, "url": url};

    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }

  void seek(double position) {
    var request = {"operation": Operation.seek, "position": position};

    var packet = json.encode(request);
    this.channel.sink.add(packet);
  }
}
