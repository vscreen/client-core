///
//  Generated code. Do not modify.
//  source: vscreen.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

import 'vscreen.pbenum.dart';

export 'vscreen.pbenum.dart';

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Empty')
    ..hasRequiredFields = false;

  Empty() : super();
  Empty.fromBuffer(List<int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  Empty.fromJson(String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  Empty clone() => new Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  static Empty create() => new Empty();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => new $pb.PbList<Empty>();
  static Empty getDefault() => _defaultInstance ??= create()..freeze();
  static Empty _defaultInstance;
  static void $checkItem(Empty v) {
    if (v is! Empty) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }
}

class Status extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Status')
    ..e<Status_Code>(1, 'code', $pb.PbFieldType.OE, Status_Code.OK,
        Status_Code.valueOf, Status_Code.values)
    ..hasRequiredFields = false;

  Status() : super();
  Status.fromBuffer(List<int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  Status.fromJson(String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  Status clone() => new Status()..mergeFromMessage(this);
  Status copyWith(void Function(Status) updates) =>
      super.copyWith((message) => updates(message as Status));
  $pb.BuilderInfo get info_ => _i;
  static Status create() => new Status();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => new $pb.PbList<Status>();
  static Status getDefault() => _defaultInstance ??= create()..freeze();
  static Status _defaultInstance;
  static void $checkItem(Status v) {
    if (v is! Status) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  Status_Code get code => $_getN(0);
  set code(Status_Code v) {
    setField(1, v);
  }

  bool hasCode() => $_has(0);
  void clearCode() => clearField(1);
}

class Credential extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Credential')
    ..aOS(1, 'password')
    ..hasRequiredFields = false;

  Credential() : super();
  Credential.fromBuffer(List<int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  Credential.fromJson(String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  Credential clone() => new Credential()..mergeFromMessage(this);
  Credential copyWith(void Function(Credential) updates) =>
      super.copyWith((message) => updates(message as Credential));
  $pb.BuilderInfo get info_ => _i;
  static Credential create() => new Credential();
  Credential createEmptyInstance() => create();
  static $pb.PbList<Credential> createRepeated() =>
      new $pb.PbList<Credential>();
  static Credential getDefault() => _defaultInstance ??= create()..freeze();
  static Credential _defaultInstance;
  static void $checkItem(Credential v) {
    if (v is! Credential) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get password => $_getS(0, '');
  set password(String v) {
    $_setString(0, v);
  }

  bool hasPassword() => $_has(0);
  void clearPassword() => clearField(1);
}

class Source extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Source')
    ..aOS(1, 'url')
    ..hasRequiredFields = false;

  Source() : super();
  Source.fromBuffer(List<int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  Source.fromJson(String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  Source clone() => new Source()..mergeFromMessage(this);
  Source copyWith(void Function(Source) updates) =>
      super.copyWith((message) => updates(message as Source));
  $pb.BuilderInfo get info_ => _i;
  static Source create() => new Source();
  Source createEmptyInstance() => create();
  static $pb.PbList<Source> createRepeated() => new $pb.PbList<Source>();
  static Source getDefault() => _defaultInstance ??= create()..freeze();
  static Source _defaultInstance;
  static void $checkItem(Source v) {
    if (v is! Source) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get url => $_getS(0, '');
  set url(String v) {
    $_setString(0, v);
  }

  bool hasUrl() => $_has(0);
  void clearUrl() => clearField(1);
}

class Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Position')
    ..a<double>(1, 'value', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  Position() : super();
  Position.fromBuffer(List<int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  Position.fromJson(String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  Position clone() => new Position()..mergeFromMessage(this);
  Position copyWith(void Function(Position) updates) =>
      super.copyWith((message) => updates(message as Position));
  $pb.BuilderInfo get info_ => _i;
  static Position create() => new Position();
  Position createEmptyInstance() => create();
  static $pb.PbList<Position> createRepeated() => new $pb.PbList<Position>();
  static Position getDefault() => _defaultInstance ??= create()..freeze();
  static Position _defaultInstance;
  static void $checkItem(Position v) {
    if (v is! Position) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get value => $_getN(0);
  set value(double v) {
    $_setFloat(0, v);
  }

  bool hasValue() => $_has(0);
  void clearValue() => clearField(1);
}
