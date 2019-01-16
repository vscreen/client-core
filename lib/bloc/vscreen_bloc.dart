import 'package:bloc/bloc.dart';
import 'vscreen_event.dart';
import 'vscreen_state.dart';

class VScreenBloc extends Bloc<VScreenEvent, VScreenState> {
  @override
  VScreenState get initialState => VScreenState.inital();

  @override
  Stream<VScreenState> mapEventToState(
      VScreenState currentState, VScreenEvent event) async* {
    if (event is Connect) {
      currentState.connect(event.url, event.port);
    } else if (event is Play) {
      currentState.play();
    } else if (event is Pause) {
      currentState.pause();
    } else if (event is Stop) {
      currentState.stop();
    } else if (event is Next) {
      currentState.next();
    } else if (event is Add) {
      currentState.add(event.url);
    } else if (event is Seek) {
      currentState.seek(event.position);
    }

    yield currentState;
  }
}
