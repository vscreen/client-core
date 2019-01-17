import '../../lib/model/vscreen_client_core.dart';
import '../../lib/bloc/vscreen_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockVScreen extends Mock implements VScreen {}

void main() async {
  group('VScreenBloc', () {
    test('', () {
      var vscreen = MockVScreen();
      var vscreenBloc = VScreenBloc.test(vscreen);
    });
  });
}
