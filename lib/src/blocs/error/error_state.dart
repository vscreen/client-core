import 'package:meta/meta.dart';

@immutable
class ErrorState {
  final String reason;
  ErrorState({this.reason = ""});
}
