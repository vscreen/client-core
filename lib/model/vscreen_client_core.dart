import '../generated/vscreen.pb.dart';
import '../generated/vscreen.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

class VScreen {
  ClientChannel channel;
  VScreenClient stub;
  final Empty _empty = Empty();
  final String _id = Uuid().v4();
  User _user;

  VScreen(String url, int port) {
    _user = User();
    _user.id = _id;

    channel = ClientChannel(url,
        port: port,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    stub = VScreenClient(channel,
        options: new CallOptions(timeout: new Duration(seconds: 30)));
  }

  void close() async {
    await this._unsubscribe();
    await this.channel.shutdown();
  }

  Future<Status> auth(String password) async {
    var credential = Credential();
    credential.password = password;
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

  Stream<Info> subscribe() async* {
    var infoStream = stub.subscribe(_user);
    await for (var info in infoStream) {
      yield info;
    }
  }

  Future<Status> _unsubscribe() async {
    return await stub.unsubscribe(_user);
  }
}
