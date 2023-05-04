library bloc_supreme;

import 'dart:async';

import 'package:synchronized/synchronized.dart';

abstract class Bloc<S> {
  Bloc(S initialState) {
    _stateController.add(initialState);
  }

  final StreamController<S> _stateController = StreamController.broadcast();

  final Lock _lock = Lock();

  Stream<S> get state => _stateController.stream;

  Future<void> execute(Event<S> event) {
    event._bloc = this;
    return _lock.synchronized(event);
  }

  void close() {
    _stateController.close();
  }
}

abstract class Event<S> {
  late Bloc<S> _bloc;

  FutureOr<void> proceed();

  void onError(dynamic error, StackTrace stackTrace) {}

  FutureOr<void> call() {
    return Future.value(proceed()).catchError(onError);
  }

  void emit(S state) {
    _bloc._stateController.add(state);
  }
}
