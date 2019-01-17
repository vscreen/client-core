import 'dart:async';

import 'vscreen_event.dart';
import 'vscreen_state.dart';
import 'exceptions.dart';
import '../model/vscreen_client_core.dart';

class VScreenBloc {
  final StreamController<VScreenEvent> _eventController = StreamController();
  EventSink get _inEvent => _eventController.sink;

  final StreamController<VScreenState> _stateController =
      StreamController.broadcast();
  EventSink get _inState => _stateController.sink;
  Stream get vscreenState => _stateController.stream;

  VScreenState _state;
  VScreen _vscreen = null; // Repository

  VScreenBloc() {
    _state = VScreenState.inital();
    _eventController.stream.listen(mapEventToState);
  }

  /// DO NOT USE THIS CONSTRUCTOR!
  VScreenBloc.test(VScreen vscreen) {
    _vscreen = vscreen;
    _state = VScreenState.inital();
    _eventController.stream.listen(mapEventToState);
  }

  void mapEventToState(VScreenEvent event) {
    // clear up error reason to avoid false false error.
    _state.errorReason = "";

    try {
      if (event is Connect) {
        _connect(event);
      } else if (event is Play) {
        _play(event);
      } else if (event is Pause) {
        _pause(event);
      } else if (event is Stop) {
        _stop(event);
      } else if (event is Next) {
        _next(event);
      } else if (event is Add) {
        _add(event);
      } else if (event is Seek) {
        _seek(event);
      }
    } on OperationFailed catch (e) {
      _error(event, e.cause);
    } on Exception catch (_) {
      _error(event, "unknown error");
    }

    _inState.add(_state);
  }

  void dispatch(VScreenEvent event) {
    _inEvent.add(event);
  }

  void dispose() async {
    await _vscreen.unsubscribe();
    _vscreen.close();
    _state = VScreenState.inital();
  }

  void _connect(Connect e) async {
    if (_vscreen != null) {
      _vscreen.unsubscribe();
      _vscreen.close();
    }

    _vscreen = VScreen(e.url, e.port);
    _vscreen.subscribe().listen((info) {
      _state.title = info.title;
      _state.thumbnailURL = info.thumbnailURL;
      _state.volume = info.volume;
      _state.position = info.position;

      switch (info.state.name) {
        case "PLAYING":
          _state.isPlaying = true;
          break;
        case "PAUSED":
        case "STOPPED":
          _state.isPlaying = false;
          break;
      }
      dispatch(ServerUpdate());
    });
    _state.url = e.url;
    _state.port = e.port;
  }

  void _play(Play e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.play();
    if (status.code.name != "OK") {
      throw OperationFailed();
    }
  }

  void _pause(Pause e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.pause();
    if (status.code.name != "OK") {
      throw OperationFailed();
    }
  }

  void _stop(Stop e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.stop();
    if (status.code.name != "OK") {
      throw OperationFailed();
    }
  }

  void _next(Next e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.next();
    if (status.code.name != "OK") {
      throw OperationFailed();
    }
  }

  void _add(Add e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.add(e.url);
    if (status.code.name != "OK") {
      throw OperationFailed();
    }
  }

  void _seek(Seek e) async {
    if (_vscreen == null) return;
    var status = await _vscreen.pause();
    if (status.code.name != "OK") {
      throw OperationFailed();
    }
  }

  /// set error reason to state
  void _error(VScreenEvent e, String reason) {
    _state.errorReason = "[${e.toString()}] ${reason}";
  }
}
