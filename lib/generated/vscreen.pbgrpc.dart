///
//  Generated code. Do not modify.
//  source: vscreen.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/grpc.dart';

import 'vscreen.pb.dart';
export 'vscreen.pb.dart';

class VScreenClient extends Client {
  static final _$auth = new ClientMethod<Credential, Status>(
      '/VScreen/Auth',
      (Credential value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$play = new ClientMethod<Empty, Status>(
      '/VScreen/Play',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$pause = new ClientMethod<Empty, Status>(
      '/VScreen/Pause',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$stop = new ClientMethod<Empty, Status>(
      '/VScreen/Stop',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$next = new ClientMethod<Empty, Status>(
      '/VScreen/Next',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$add = new ClientMethod<Source, Status>(
      '/VScreen/Add',
      (Source value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$seek = new ClientMethod<Position, Status>(
      '/VScreen/Seek',
      (Position value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$subscribe = new ClientMethod<User, Info>(
      '/VScreen/Subscribe',
      (User value) => value.writeToBuffer(),
      (List<int> value) => new Info.fromBuffer(value));
  static final _$unsubscribe = new ClientMethod<User, Status>(
      '/VScreen/Unsubscribe',
      (User value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));

  VScreenClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<Status> auth(Credential request, {CallOptions options}) {
    final call = $createCall(_$auth, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Status> play(Empty request, {CallOptions options}) {
    final call = $createCall(_$play, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Status> pause(Empty request, {CallOptions options}) {
    final call = $createCall(_$pause, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Status> stop(Empty request, {CallOptions options}) {
    final call = $createCall(_$stop, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Status> next(Empty request, {CallOptions options}) {
    final call = $createCall(_$next, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Status> add(Source request, {CallOptions options}) {
    final call = $createCall(_$add, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Status> seek(Position request, {CallOptions options}) {
    final call = $createCall(_$seek, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseStream<Info> subscribe(User request, {CallOptions options}) {
    final call = $createCall(
        _$subscribe, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseStream(call);
  }

  ResponseFuture<Status> unsubscribe(User request, {CallOptions options}) {
    final call = $createCall(
        _$unsubscribe, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class VScreenServiceBase extends Service {
  String get $name => 'VScreen';

  VScreenServiceBase() {
    $addMethod(new ServiceMethod<Credential, Status>(
        'Auth',
        auth_Pre,
        false,
        false,
        (List<int> value) => new Credential.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Empty, Status>(
        'Play',
        play_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Empty, Status>(
        'Pause',
        pause_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Empty, Status>(
        'Stop',
        stop_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Empty, Status>(
        'Next',
        next_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Source, Status>(
        'Add',
        add_Pre,
        false,
        false,
        (List<int> value) => new Source.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Position, Status>(
        'Seek',
        seek_Pre,
        false,
        false,
        (List<int> value) => new Position.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<User, Info>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        (List<int> value) => new User.fromBuffer(value),
        (Info value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<User, Status>(
        'Unsubscribe',
        unsubscribe_Pre,
        false,
        false,
        (List<int> value) => new User.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
  }

  $async.Future<Status> auth_Pre(
      ServiceCall call, $async.Future request) async {
    return auth(call, await request);
  }

  $async.Future<Status> play_Pre(
      ServiceCall call, $async.Future request) async {
    return play(call, await request);
  }

  $async.Future<Status> pause_Pre(
      ServiceCall call, $async.Future request) async {
    return pause(call, await request);
  }

  $async.Future<Status> stop_Pre(
      ServiceCall call, $async.Future request) async {
    return stop(call, await request);
  }

  $async.Future<Status> next_Pre(
      ServiceCall call, $async.Future request) async {
    return next(call, await request);
  }

  $async.Future<Status> add_Pre(ServiceCall call, $async.Future request) async {
    return add(call, await request);
  }

  $async.Future<Status> seek_Pre(
      ServiceCall call, $async.Future request) async {
    return seek(call, await request);
  }

  $async.Stream<Info> subscribe_Pre(
      ServiceCall call, $async.Future request) async* {
    yield* subscribe(call, (await request) as User);
  }

  $async.Future<Status> unsubscribe_Pre(
      ServiceCall call, $async.Future request) async {
    return unsubscribe(call, await request);
  }

  $async.Future<Status> auth(ServiceCall call, Credential request);
  $async.Future<Status> play(ServiceCall call, Empty request);
  $async.Future<Status> pause(ServiceCall call, Empty request);
  $async.Future<Status> stop(ServiceCall call, Empty request);
  $async.Future<Status> next(ServiceCall call, Empty request);
  $async.Future<Status> add(ServiceCall call, Source request);
  $async.Future<Status> seek(ServiceCall call, Position request);
  $async.Stream<Info> subscribe(ServiceCall call, User request);
  $async.Future<Status> unsubscribe(ServiceCall call, User request);
}
