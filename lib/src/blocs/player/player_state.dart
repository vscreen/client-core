import 'package:meta/meta.dart';

@immutable
class PlayerState {
  final String title;
  final String thumbnail;
  final bool playing;
  final double position;
  final double volume;

  PlayerState(
      {this.title = "video title",
      this.thumbnail = "",
      this.playing = false,
      this.position = 0.0,
      this.volume = 0.0});
}
