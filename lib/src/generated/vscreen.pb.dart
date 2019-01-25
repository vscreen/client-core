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
    ..hasRequiredFields = false
  ;

  Empty() : super();
  Empty.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Empty.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Empty clone() => new Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
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
    ..e<StatusCode>(1, 'code', $pb.PbFieldType.OE, StatusCode.OK, StatusCode.valueOf, StatusCode.values)
    ..hasRequiredFields = false
  ;

  Status() : super();
  Status.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Status.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Status clone() => new Status()..mergeFromMessage(this);
  Status copyWith(void Function(Status) updates) => super.copyWith((message) => updates(message as Status));
  $pb.BuilderInfo get info_ => _i;
  static Status create() => new Status();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => new $pb.PbList<Status>();
  static Status getDefault() => _defaultInstance ??= create()..freeze();
  static Status _defaultInstance;
  static void $checkItem(Status v) {
    if (v is! Status) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  StatusCode get code => $_getN(0);
  set code(StatusCode v) { setField(1, v); }
  bool hasCode() => $_has(0);
  void clearCode() => clearField(1);
}

class Credential extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Credential')
    ..aOS(1, 'password')
    ..hasRequiredFields = false
  ;

  Credential() : super();
  Credential.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Credential.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Credential clone() => new Credential()..mergeFromMessage(this);
  Credential copyWith(void Function(Credential) updates) => super.copyWith((message) => updates(message as Credential));
  $pb.BuilderInfo get info_ => _i;
  static Credential create() => new Credential();
  Credential createEmptyInstance() => create();
  static $pb.PbList<Credential> createRepeated() => new $pb.PbList<Credential>();
  static Credential getDefault() => _defaultInstance ??= create()..freeze();
  static Credential _defaultInstance;
  static void $checkItem(Credential v) {
    if (v is! Credential) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get password => $_getS(0, '');
  set password(String v) { $_setString(0, v); }
  bool hasPassword() => $_has(0);
  void clearPassword() => clearField(1);
}

class Source extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Source')
    ..aOS(1, 'url')
    ..hasRequiredFields = false
  ;

  Source() : super();
  Source.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Source.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Source clone() => new Source()..mergeFromMessage(this);
  Source copyWith(void Function(Source) updates) => super.copyWith((message) => updates(message as Source));
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
  set url(String v) { $_setString(0, v); }
  bool hasUrl() => $_has(0);
  void clearUrl() => clearField(1);
}

class Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Position')
    ..a<double>(1, 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  Position() : super();
  Position.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Position.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Position clone() => new Position()..mergeFromMessage(this);
  Position copyWith(void Function(Position) updates) => super.copyWith((message) => updates(message as Position));
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
  set value(double v) { $_setDouble(0, v); }
  bool hasValue() => $_has(0);
  void clearValue() => clearField(1);
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('User')
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  User() : super();
  User.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  User.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  User clone() => new User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  static User create() => new User();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => new $pb.PbList<User>();
  static User getDefault() => _defaultInstance ??= create()..freeze();
  static User _defaultInstance;
  static void $checkItem(User v) {
    if (v is! User) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get id => $_getS(0, '');
  set id(String v) { $_setString(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);
}

class Info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Info')
    ..aOS(1, 'title')
    ..aOS(2, 'thumbnail')
    ..a<double>(3, 'volume', $pb.PbFieldType.OD)
    ..a<double>(4, 'position', $pb.PbFieldType.OD)
    ..aOB(5, 'playing')
    ..hasRequiredFields = false
  ;

  Info() : super();
  Info.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Info.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Info clone() => new Info()..mergeFromMessage(this);
  Info copyWith(void Function(Info) updates) => super.copyWith((message) => updates(message as Info));
  $pb.BuilderInfo get info_ => _i;
  static Info create() => new Info();
  Info createEmptyInstance() => create();
  static $pb.PbList<Info> createRepeated() => new $pb.PbList<Info>();
  static Info getDefault() => _defaultInstance ??= create()..freeze();
  static Info _defaultInstance;
  static void $checkItem(Info v) {
    if (v is! Info) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get title => $_getS(0, '');
  set title(String v) { $_setString(0, v); }
  bool hasTitle() => $_has(0);
  void clearTitle() => clearField(1);

  String get thumbnail => $_getS(1, '');
  set thumbnail(String v) { $_setString(1, v); }
  bool hasThumbnail() => $_has(1);
  void clearThumbnail() => clearField(2);

  double get volume => $_getN(2);
  set volume(double v) { $_setDouble(2, v); }
  bool hasVolume() => $_has(2);
  void clearVolume() => clearField(3);

  double get position => $_getN(3);
  set position(double v) { $_setDouble(3, v); }
  bool hasPosition() => $_has(3);
  void clearPosition() => clearField(4);

  bool get playing => $_get(4, false);
  set playing(bool v) { $_setBool(4, v); }
  bool hasPlaying() => $_has(4);
  void clearPlaying() => clearField(5);
}

