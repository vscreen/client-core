///
//  Generated code. Do not modify.
//  source: vscreen.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Status_Code extends $pb.ProtobufEnum {
  static const Status_Code OK = const Status_Code._(0, 'OK');

  static const List<Status_Code> values = const <Status_Code> [
    OK,
  ];

  static final Map<int, Status_Code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status_Code valueOf(int value) => _byValue[value];
  static void $checkItem(Status_Code v) {
    if (v is! Status_Code) $pb.checkItemFailed(v, 'Status_Code');
  }

  const Status_Code._(int v, String n) : super(v, n);
}

