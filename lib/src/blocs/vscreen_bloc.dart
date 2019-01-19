import './connection/connection_bloc.dart';
import './error/error_bloc.dart';
import './player/player_bloc.dart';

class VScreenBloc {
  final ConnectionBloc connection = ConnectionBloc();
  final ErrorBloc error = ErrorBloc();
  final PlayerBloc player = PlayerBloc();

  static final VScreenBloc _internal = VScreenBloc();

  factory VScreenBloc() {
    return _internal;
  }

  void dispose() {
    connection.dispose();
    error.dispose();
    player.dispose();
  }
}
