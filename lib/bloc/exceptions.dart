class OperationFailed implements Exception {
  String cause;
  OperationFailed({this.cause = "operation failed"});
}
