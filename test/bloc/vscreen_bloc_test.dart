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
  group('play', () {
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
    });

    test('should fail with operation failed', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.play()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Play());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[play] operation failed"));
    });

    test('should fail with unknown error', () async {
      var vscreen = MockVScreen();
      when(vscreen.play()).thenAnswer((_) => throw Exception());

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Play());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[play] unknown error"));
    });
  });

  group('pause', () {
    test('should add pause operation and set states properly', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OK;
      when(vscreen.pause()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Pause());
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
    });

    test('should fail with operation failed', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.pause()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Pause());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[pause] operation failed"));
    });

    test('should fail with unknown error', () async {
      var vscreen = MockVScreen();
      when(vscreen.pause()).thenAnswer((_) => throw Exception());

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Pause());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[pause] unknown error"));
    });
  });

  group('stop', () {
    test('should add stop operation and set states properly', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OK;
      when(vscreen.stop()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Stop());
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
    });

    test('should fail with operation failed', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.stop()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Stop());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[stop] operation failed"));
    });

    test('should fail with unknown error', () async {
      var vscreen = MockVScreen();
      when(vscreen.stop()).thenAnswer((_) => throw Exception());

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Stop());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[stop] unknown error"));
    });
  });

  group('next', () {
    test('should add next operation and set states properly', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OK;
      when(vscreen.next()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Next());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals(""));
    });

    test('should fail with operation failed', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.next()).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Next());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[next] operation failed"));
    });

    test('should fail with unknown error', () async {
      var vscreen = MockVScreen();
      when(vscreen.next()).thenAnswer((_) => throw Exception());

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Next());
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[next] unknown error"));
    });
  });

  group('add', () {
    test('should add add operation and set states properly', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OK;
      when(vscreen.add('url')).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Add('url'));
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals(""));
    });

    test('should fail with operation failed', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.add('url')).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Add('url'));
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[add] operation failed"));
    });

    test('should fail with unknown error', () async {
      var vscreen = MockVScreen();
      when(vscreen.add('url')).thenAnswer((_) => throw Exception());

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Add('url'));
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[add] unknown error"));
    });
  });

  group('seek', () {
    test('should add seek operation and set states properly', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OK;
      when(vscreen.seek(0.0)).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Seek(0.0));
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals(""));
    });

    test('should fail with operation failed', () async {
      var vscreen = MockVScreen();
      var status = Status();
      status.code = StatusCode.OPERATION_FAILED;
      when(vscreen.seek(0.0)).thenAnswer((_) => Future.value(status));

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Seek(0.0));
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[seek] operation failed"));
    });

    test('should fail with unknown error', () async {
      var vscreen = MockVScreen();
      when(vscreen.seek(0.0)).thenAnswer((_) => throw Exception());

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Seek(0.0));
      var curState = await stateQueue.next;
      expect(curState.url, equals(""));
      expect(curState.port, equals(8080));
      expect(curState.title, equals("video title"));
      expect(curState.thumbnailURL, equals(""));
      expect(curState.isPlaying, equals(false));
      expect(curState.position, equals(0.0));
      expect(curState.errorReason, equals("[seek] unknown error"));
    });
  });

  group('connect', () {
    test('should get server responses after operations', () async {
      var vscreen = MockVScreen();
      Info info1 = Info();
      info1.title = "title1";
      info1.thumbnailURL = "thumbnail1";
      info1.volume = 1;
      info1.position = 0.1;
      info1.state = Info_State.PLAYING;

      var infos = Stream.fromIterable([info1]);

      when(vscreen.subscribe()).thenAnswer((_) => infos);

      var vscreenBloc = VScreenBloc.test(vscreen);
      var stateQueue = StreamQueue(vscreenBloc.vscreenState);

      vscreenBloc.dispatch(Connect("127.0.0.1", 8080));
      var curState = await stateQueue.next;
      expect(curState.url, equals("127.0.0.1"));
      expect(curState.port, equals(8080));
      verify(vscreen.close());
      verify(vscreen.unsubscribe());

      curState = await stateQueue.next;
      expect(curState.title, equals(info1.title));
      expect(curState.thumbnailURL, equals(info1.thumbnailURL));
      expect(curState.volume, equals(info1.volume));
      expect(curState.position, equals(info1.position));
      expect(curState.isPlaying, equals(true));
    });
  });
}
