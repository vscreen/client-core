import 'package:meta/meta.dart';

abstract class PlayerState {}

@immutable
class NewInfo extends PlayerState {
  final String title;
  final String thumbnail;
  final bool playing;
  final double position;
  final double volume;

  NewInfo(
      {this.title = "video title",
      this.thumbnail = "",
      this.playing = false,
      this.position = 0.0,
      this.volume = 0.0});
}

@immutable
class OperationFailed extends PlayerState {
  final String reason;

  OperationFailed({@required this.reason});
}
