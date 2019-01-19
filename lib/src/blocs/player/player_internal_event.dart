import './player_event.dart';
import '../../generated/vscreen.pb.dart';
import '../../model/vscreen_client_core.dart';

class SetVScreen extends PlayerEvent {
  final VScreen vscreen;

  SetVScreen(this.vscreen) {}

  @override
  String toString() {
    return "set vscreen";
  }
}

class ServerUpdate extends PlayerEvent {
  final Info info;
  ServerUpdate(this.info);
}
