import 'generated/vscreen.pb.dart';
import 'generated/vscreen.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class VScreen {
  ClientChannel channel;
  VScreenClient stub;
  final Empty _empty = Empty();

  VScreen(String url, int port) {
    channel = ClientChannel(url,
        port: port,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    stub = VScreenClient(channel,
        options: new CallOptions(timeout: new Duration(seconds: 30)));
  }

  void close() async {
    await this.channel.shutdown();
  }

  Future<Status> auth(Credential credential) async {
    return await stub.auth(credential);
  }

  Future<Status> play() async {
    return await stub.play(_empty);
  }

  Future<Status> pause() async {
    return await stub.pause(_empty);
  }

  Future<Status> stop() async {
    return await stub.stop(_empty);
  }

  Future<Status> next() async {
    return await stub.next(_empty);
  }

  Future<Status> add(String url) async {
    var source = Source();
    source.url = url;
    return await stub.add(source);
  }

  Future<Status> seek(double pos) async {
    var position = Position();
    position.value = pos;
    return await stub.seek(position);
  }
}
