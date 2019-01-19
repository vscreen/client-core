import 'package:bloc/bloc.dart';
import './error_internal_event.dart';
import './error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  static final ErrorBloc _instance = ErrorBloc._();

  ErrorBloc._() {}

  factory ErrorBloc() {
    return _instance;
  }

  @override
  ErrorState get initialState => ErrorState();

  @override
  Stream<ErrorState> mapEventToState(
      ErrorState currentState, ErrorEvent event) async* {
    if (event is NewError) {
      yield ErrorState(reason: event.reason);
    }
  }
}
