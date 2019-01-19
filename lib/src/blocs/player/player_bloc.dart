import 'package:bloc/bloc.dart';
import './player_event.dart';
import './player_state.dart';
import '../exceptions.dart';
import '../../model/vscreen_client_core.dart';
import '../../generated/vscreen.pb.dart';
import './player_internal_event.dart';
import '../error/error_bloc.dart';
import '../error/error_internal_event.dart';
import 'dart:async';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  VScreen _vscreen = null;
  StreamSubscription _subscription = null;

  final ErrorBloc _errorBloc;

  static final PlayerBloc _internal = PlayerBloc._();

  PlayerBloc._() : _errorBloc = ErrorBloc() {}

  factory PlayerBloc() {
    return _internal;
  }

  @override
  void dispose() {
    _cleanupVScreen();
    super.dispose();
  }

  @override
  PlayerState get initialState => PlayerState();

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
    } on OperationFailed catch (e) {
      _emitError(event, e.cause);
    } on Exception catch (_) {
      _emitError(event, "unknown error");
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
    return PlayerState(
        title: info.title,
        thumbnailURL: info.thumbnailURL,
        isPlaying: info.state == Info_State.PLAYING ? true : false,
        position: info.position,
        volume: info.volume);
  }

  Future<void> _play(Play e) async {
    var status = await _vscreen.play();
    if (status.code != StatusCode.OK) {
      throw OperationFailed();
    }
  }

  Future<void> _pause(Pause e) async {
    var status = await _vscreen.pause();
    if (status.code != StatusCode.OK) {
      throw OperationFailed();
    }
  }

  Future<void> _stop(Stop e) async {
    var status = await _vscreen.stop();
    if (status.code != StatusCode.OK) {
      throw OperationFailed();
    }
  }

  Future<void> _next(Next e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.next();
    if (status.code != StatusCode.OK) {
      throw OperationFailed();
    }
  }

  Future<void> _add(Add e) async {
    var status = await _vscreen.add(e.url);
    if (status.code != StatusCode.OK) {
      throw OperationFailed();
    }
  }

  Future<void> _seek(Seek e) async {
    var status = await _vscreen.seek(e.position);
    if (status.code != StatusCode.OK) {
      throw OperationFailed();
    }
  }

  void _emitError(PlayerEvent e, String reason) {
    _errorBloc.dispatch(NewError(reason: "[${e.toString()}] ${reason}"));
  }
}
