import 'package:meta/meta.dart';

@immutable
class PlayerState {
  final String title;
  final String thumbnailURL;
  final bool isPlaying;
  final double position;
  final double volume;

  PlayerState(
      {this.title = "video title",
      this.thumbnailURL = "",
      this.isPlaying = false,
      this.position = 0.0,
      this.volume = 0.0});
}
