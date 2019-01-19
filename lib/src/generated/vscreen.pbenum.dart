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

class Info_State extends $pb.ProtobufEnum {
  static const Info_State PLAYING = const Info_State._(0, 'PLAYING');
  static const Info_State PAUSED = const Info_State._(1, 'PAUSED');
  static const Info_State STOPPED = const Info_State._(2, 'STOPPED');

  static const List<Info_State> values = const <Info_State> [
    PLAYING,
    PAUSED,
    STOPPED,
  ];

  static final Map<int, Info_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Info_State valueOf(int value) => _byValue[value];
  static void $checkItem(Info_State v) {
    if (v is! Info_State) $pb.checkItemFailed(v, 'Info_State');
  }

  const Info_State._(int v, String n) : super(v, n);
}

