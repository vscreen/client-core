import 'package:bloc/bloc.dart';
import './player_event.dart';
import './player_state.dart';
import '../../model/vscreen_client_core.dart';
import '../../generated/vscreen.pb.dart';
import './player_internal_event.dart';
import 'dart:async';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  VScreen _vscreen = null;
  StreamSubscription _subscription = null;

  static final PlayerBloc _internal = PlayerBloc._();

  PlayerBloc._() {}

  factory PlayerBloc() {
    return _internal;
  }

  @override
  void dispose() {
    _cleanupVScreen();
    super.dispose();
  }

  @override
  PlayerState get initialState => NewInfo();

  @override
  Stream<PlayerState> mapEventToState(
      PlayerState currentState, PlayerEvent event) async* {
    print("[player] received ${event} event");
    try {
      if (event is SetVScreen) {
        await _setVScreen(event);
      } else {
        if (_vscreen == null) return;

        if (event is ServerUpdate) {
          yield _serverUpdate(event);
        } else if (event is Play) {
          await _play(event);
        } else if (event is Pause) {
          await _pause(event);
        } else if (event is Stop) {
          await _stop(event);
        } else if (event is Next) {
          await _next(event);
        } else if (event is Add) {
          await _add(event);
        } else if (event is Seek) {
          await _seek(event);
        }
      }
    } on Exception catch (_) {
      yield OperationFailed(reason: "operation failed");
    }
  }

  Future<void> _cleanupVScreen() async {
    if (_vscreen != null) {
      await _vscreen.unsubscribe();
      await _vscreen.close();
      _vscreen = null;
    }

    if (_subscription != null) {
      await _subscription.cancel();
      _subscription = null;
    }
  }

  Future<void> _setVScreen(SetVScreen e) async {
    await _cleanupVScreen();

    _vscreen = e.vscreen;
    _subscription = _vscreen.subscribe().listen((info) {
      this.dispatch(ServerUpdate(info));
    });
  }

  PlayerState _serverUpdate(ServerUpdate e) {
    var info = e.info;
    return NewInfo(
        title: info.title,
        thumbnail: info.thumbnail,
        playing: info.playing,
        position: info.position,
        volume: info.volume);
  }

  Future<void> _play(Play e) async {
    var status = await _vscreen.play();
    if (status.code != StatusCode.OK) {
      throw Exception();
    }
  }

  Future<void> _pause(Pause e) async {
    var status = await _vscreen.pause();
    if (status.code != StatusCode.OK) {
      throw Exception();
    }
  }

  Future<void> _stop(Stop e) async {
    var status = await _vscreen.stop();
    if (status.code != StatusCode.OK) {
      throw Exception();
    }
  }

  Future<void> _next(Next e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.next();
    if (status.code != StatusCode.OK) {
      throw Exception();
    }
  }

  Future<void> _add(Add e) async {
    var status = await _vscreen.add(e.url);
    if (status.code != StatusCode.OK) {
      throw Exception();
    }
  }

  Future<void> _seek(Seek e) async {
    var status = await _vscreen.seek(e.position);
    if (status.code != StatusCode.OK) {
      throw Exception();
    }
  }
}
