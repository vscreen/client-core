import 'package:meta/meta.dart';

abstract class ErrorEvent {}

@immutable
class NewError extends ErrorEvent {
  final String reason;
  NewError({this.reason = ""});
}
