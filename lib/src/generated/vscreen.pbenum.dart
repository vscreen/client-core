///
//  Generated code. Do not modify.
//  source: vscreen.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class StatusCode extends $pb.ProtobufEnum {
  static const StatusCode OK = const StatusCode._(0, 'OK');
  static const StatusCode OPERATION_FAILED = const StatusCode._(1, 'OPERATION_FAILED');

  static const List<StatusCode> values = const <StatusCode> [
    OK,
    OPERATION_FAILED,
  ];

  static final Map<int, StatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StatusCode valueOf(int value) => _byValue[value];
  static void $checkItem(StatusCode v) {
    if (v is! StatusCode) $pb.checkItemFailed(v, 'StatusCode');
  }

  const StatusCode._(int v, String n) : super(v, n);
}

