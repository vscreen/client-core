import 'package:rxdart/rxdart.dart';
import './vscreen_state.dart' as state;
import './generated/vscreen.pb.dart';
import './generated/vscreen.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';

class VScreenBloc {
  final _connectionSubject = BehaviorSubject<state.ConnectionState>();
  final _playerSubject = BehaviorSubject<state.PlayerState>();

  Observable<state.ConnectionState> get connection => _connectionSubject.stream;
  Observable<state.PlayerState> get player => _playerSubject.stream;

  ClientChannel _channel = null;
  VScreenClient _stub = null;
  User _user = null;
  Stream<Info> _subscriptionChannel = null;
  state.Connected _lastConnection = null;

  Future<void> dispose() async {
    await disconnect();
    await _connectionSubject.close();
  }

  Future<void> _cleanup() async {
    if (_stub != null && _user != null) {
      try {
        await _stub.unsubscribe(_user);
      } catch (_) {}
    }
    if (_channel != null) await _channel.terminate();

    _stub = null;
    _subscriptionChannel = null;
    _channel = null;
    _user = null;
  }

  Future<void> connect(String url, int port) async {
    _connectionSubject.add(state.Connecting());
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
      await _cleanup();
      _stub = localStub;
      _channel = localChannel;
      _user = localUser;
      _subscriptionChannel = localSubscriptionChannel;

      _subscriptionChannel
          .map((info) => state.NewPlayerInfo(
              title: info.title,
              thumbnail: info.thumbnail,
              playing: info.playing,
              position: info.position,
              volume: info.volume,
              duration: info.duration.toInt()))
          .forEach((info) => _playerSubject.add(info));

      _lastConnection = state.Connected(url: url, port: port);
      _connectionSubject.add(_lastConnection);
    } catch (e) {
      _connectionSubject.addError("connection timeout");
    }
  }

  Future<void> reconnect() async {
    if (_lastConnection == null) return;
    await connect(_lastConnection.url, _lastConnection.port);
  }

  Future<void> disconnect() async {
    await _cleanup();
    _connectionSubject.add(state.Disconnected());
  }

  Future<void> play() async {
    if (_stub == null) return;
    await _stub.play(Empty());
  }

  Future<void> pause() async {
    if (_stub == null) return;
    await _stub.pause(Empty());
  }

  Future<void> stop() async {
    if (_stub == null) return;
    await _stub.stop(Empty());
  }

  Future<void> next() async {
    if (_stub == null) return;
    await _stub.next(Empty());
  }

  /// Add adds url to the player queue. This operation will wait until
  /// connected.
  Future<void> add(String url) async {
    var source = Source();
    source.url = url;

    await connection
        .firstWhere((currentState) => currentState is state.Connected);
    await _stub.add(source);
  }

  Future<void> seek(double pos) async {
    if (_stub == null) return;
    var position = Position();
    position.value = pos;
    await _stub.seek(position);
  }
}
