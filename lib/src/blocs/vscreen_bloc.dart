import './connection/connection_bloc.dart';
import './error/error_bloc.dart';
import './player/player_bloc.dart';

class VScreenBloc {
  final ConnectionBloc connection;
  final ErrorBloc error;
  final PlayerBloc player;

  static final VScreenBloc _internal = VScreenBloc._();

  VScreenBloc._()
      : connection = ConnectionBloc(),
        error = ErrorBloc(),
        player = PlayerBloc() {}

  factory VScreenBloc() {
    return _internal;
  }

  void dispose() {
    connection.dispose();
    error.dispose();
    player.dispose();
  }
}
