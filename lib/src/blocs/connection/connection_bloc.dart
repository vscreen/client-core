import 'package:bloc/bloc.dart';
import './connection_event.dart';
import './connection_state.dart';
import '../../model/vscreen_client_core.dart';
import '../error/error_bloc.dart';
import '../error/error_internal_event.dart';
import '../player/player_bloc.dart';
import '../player/player_internal_event.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final ErrorBloc _errorBloc = ErrorBloc();
  final PlayerBloc _playerBloc = PlayerBloc();

  static final ConnectionBloc _internal = ConnectionBloc();
  factory ConnectionBloc() {
    return _internal;
  }

  @override
  ConnectionState get initialState => ConnectionState();

  @override
  Stream<ConnectionState> mapEventToState(
      ConnectionState currentState, ConnectionEvent event) async* {
    try {
      if (event is Connect) {
        _playerBloc.dispatch(SetVScreen(VScreen(event.url, event.port)));
        yield ConnectionState(url: event.url, port: event.port);
      }
    } on Exception catch (_) {
      _emitError(event, "unknown error");
    }
  }

  void _emitError(ConnectionEvent e, String reason) {
    _errorBloc.dispatch(NewError(reason: "[${e.toString()}] ${reason}"));
  }
}
