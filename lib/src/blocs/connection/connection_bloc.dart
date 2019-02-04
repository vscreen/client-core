import 'package:bloc/bloc.dart';
import './connection_event.dart';
import './connection_state.dart';
import '../../model/vscreen_client_core.dart';
import '../player/player_bloc.dart';
import '../player/player_internal_event.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final PlayerBloc _playerBloc;

  static final ConnectionBloc _internal = ConnectionBloc._();

  ConnectionBloc._() : _playerBloc = PlayerBloc() {}

  factory ConnectionBloc() {
    return _internal;
  }

  @override
  ConnectionState get initialState => NewConnection(url: "", port: 8080);

  @override
  Stream<ConnectionState> mapEventToState(
      ConnectionState currentState, ConnectionEvent event) async* {
    print("[connection] received ${event} event");
    try {
      if (event is Connect) {
        _playerBloc.dispatch(SetVScreen(VScreen(event.url, event.port)));
        yield NewConnection(url: event.url, port: event.port);
      }
    } on Exception catch (_) {
      yield ConnectionFailed(reason: "connection failed");
    }
  }
}
