///
//  Generated code. Do not modify.
//  source: vscreen.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;
import 'vscreen.pb.dart';
export 'vscreen.pb.dart';

class VScreenClient extends $grpc.Client {
  static final _$auth = new $grpc.ClientMethod<Credential, Status>(
      '/VScreen/Auth',
      (Credential value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$play = new $grpc.ClientMethod<Empty, Status>(
      '/VScreen/Play',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$pause = new $grpc.ClientMethod<Empty, Status>(
      '/VScreen/Pause',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$stop = new $grpc.ClientMethod<Empty, Status>(
      '/VScreen/Stop',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$next = new $grpc.ClientMethod<Empty, Status>(
      '/VScreen/Next',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$add = new $grpc.ClientMethod<Source, Status>(
      '/VScreen/Add',
      (Source value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$seek = new $grpc.ClientMethod<Position, Status>(
      '/VScreen/Seek',
      (Position value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));
  static final _$subscribe = new $grpc.ClientMethod<User, Info>(
      '/VScreen/Subscribe',
      (User value) => value.writeToBuffer(),
      (List<int> value) => new Info.fromBuffer(value));
  static final _$unsubscribe = new $grpc.ClientMethod<User, Status>(
      '/VScreen/Unsubscribe',
      (User value) => value.writeToBuffer(),
      (List<int> value) => new Status.fromBuffer(value));

  VScreenClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<Status> auth(Credential request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$auth, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<Status> play(Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$play, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<Status> pause(Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$pause, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<Status> stop(Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$stop, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<Status> next(Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$next, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<Status> add(Source request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$add, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<Status> seek(Position request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$seek, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<Info> subscribe(User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$subscribe, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<Status> unsubscribe(User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$unsubscribe, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }
}

abstract class VScreenServiceBase extends $grpc.Service {
  String get $name => 'VScreen';

  VScreenServiceBase() {
    $addMethod(new $grpc.ServiceMethod<Credential, Status>(
        'Auth',
        auth_Pre,
        false,
        false,
        (List<int> value) => new Credential.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<Empty, Status>(
        'Play',
        play_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<Empty, Status>(
        'Pause',
        pause_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<Empty, Status>(
        'Stop',
        stop_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<Empty, Status>(
        'Next',
        next_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<Source, Status>(
        'Add',
        add_Pre,
        false,
        false,
        (List<int> value) => new Source.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<Position, Status>(
        'Seek',
        seek_Pre,
        false,
        false,
        (List<int> value) => new Position.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<User, Info>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        (List<int> value) => new User.fromBuffer(value),
        (Info value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<User, Status>(
        'Unsubscribe',
        unsubscribe_Pre,
        false,
        false,
        (List<int> value) => new User.fromBuffer(value),
        (Status value) => value.writeToBuffer()));
  }

  $async.Future<Status> auth_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return auth(call, await request);
  }

  $async.Future<Status> play_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return play(call, await request);
  }

  $async.Future<Status> pause_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return pause(call, await request);
  }

  $async.Future<Status> stop_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return stop(call, await request);
  }

  $async.Future<Status> next_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return next(call, await request);
  }

  $async.Future<Status> add_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return add(call, await request);
  }

  $async.Future<Status> seek_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return seek(call, await request);
  }

  $async.Stream<Info> subscribe_Pre(
      $grpc.ServiceCall call, $async.Future request) async* {
    yield* subscribe(call, (await request) as User);
  }

  $async.Future<Status> unsubscribe_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return unsubscribe(call, await request);
  }

  $async.Future<Status> auth($grpc.ServiceCall call, Credential request);
  $async.Future<Status> play($grpc.ServiceCall call, Empty request);
  $async.Future<Status> pause($grpc.ServiceCall call, Empty request);
  $async.Future<Status> stop($grpc.ServiceCall call, Empty request);
  $async.Future<Status> next($grpc.ServiceCall call, Empty request);
  $async.Future<Status> add($grpc.ServiceCall call, Source request);
  $async.Future<Status> seek($grpc.ServiceCall call, Position request);
  $async.Stream<Info> subscribe($grpc.ServiceCall call, User request);
  $async.Future<Status> unsubscribe($grpc.ServiceCall call, User request);
}
