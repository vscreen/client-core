import '../../lib/model/vscreen_client_core.dart';
import '../../lib/bloc/vscreen_bloc.dart';
import '../../lib/bloc/vscreen_state.dart';
import '../../lib/bloc/exceptions.dart';
import '../../lib/bloc/vscreen_event.dart';
import '../../lib/generated/vscreen.pb.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import "package:async/async.dart";

class MockVScreen extends Mock implements VScreen {}

void main() {
  group('VScreenBloc', () {
    test('should add play operation and set states properly', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OK;
      when(vscreen.play()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Play());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      // isPlaying is false because the only way to change states
      // is through server responses.
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals(""));

      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.play()).thenAnswer((_) => Future.value(status));
      vscreenBloc.dispatch(Play());
      curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[play] operation failed"));
    });
  });
}
