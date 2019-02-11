import 'package:rxdart/rxdart.dart';
import './vscreen_state.dart';
import './generated/vscreen.pb.dart';
import './generated/vscreen.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

class VScreenBloc {
  final _connectionSubject = BehaviorSubject<Connection>();
  final _infoSubject = BehaviorSubject<PlayerInfo>();

  Observable<Connection> get connection => _connectionSubject.stream;
  Observable<PlayerInfo> get info => _infoSubject.stream;

  ClientChannel _channel = null;
  VScreenClient _stub = null;
  User _user = null;
  Stream<Info> _subscriptionChannel = null;
  Connection _lastConnection = null;

  Future<void> dispose() async {
    await disconnect();
    await _infoSubject.close();
    await _connectionSubject.close();
  }

  Future<void> connect(String url, int port) async {
    var localUser = User();
    localUser.id = Uuid().v4();

    var localChannel = ClientChannel(url,
        port: port,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    var localStub = VScreenClient(localChannel);

    try {
      await localStub
          .auth(Credential())
          .timeout(Duration(seconds: 3)); // dummy check
      var localSubscriptionChannel = localStub.subscribe(localUser);

      // Safe to swap current user with new user
      await disconnect();
      _stub = localStub;
      _channel = localChannel;
      _user = localUser;
      _subscriptionChannel = localSubscriptionChannel;

      _subscriptionChannel
          .map((info) => PlayerInfo(
              title: info.title,
              thumbnail: info.thumbnail,
              playing: info.playing,
              position: info.position,
              volume: info.volume))
          .forEach((info) => _infoSubject.add(info));

      _lastConnection = Connection(url: url, port: port);
      _connectionSubject.add(_lastConnection);
    } catch (e) {
      print(e);
      _connectionSubject.addError("connection timeout");
    }
  }

  Future<void> reconnect() async {
    if (_lastConnection == null) return;
    await connect(_lastConnection.url, _lastConnection.port);
  }

  Future<void> disconnect() async {
    print("1");
    if (_stub != null && _user != null) {
      try {
        await _stub.unsubscribe(_user);
      } catch (_) {}
    }
    print("2");
    if (_channel != null) await _channel.shutdown();

    _stub = null;
    _subscriptionChannel = null;
    _channel = null;
    _user = null;
    print("3");
    _connectionSubject.add(Connection(url: "", port: 8080));
  }

  Future<void> play() async {
    await _stub.play(Empty());
  }

  Future<void> pause() async {
    await _stub.pause(Empty());
  }

  Future<void> stop() async {
    await _stub.stop(Empty());
  }

  Future<void> next() async {
    await _stub.next(Empty());
  }

  Future<void> add(String url) async {
    var source = Source();
    source.url = url;
    await _stub.add(source);
  }

  Future<void> seek(double pos) async {
    var position = Position();
    position.value = pos;
    await _stub.seek(position);
  }
}
