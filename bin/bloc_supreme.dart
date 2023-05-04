import 'dart:async';

import 'package:bloc_supreme/bloc_supreme.dart';

void main(List<String> arguments) {
  CounterBloc()
    ..execute(CountEvent())
    ..execute(CountEvent());
}

class CounterBloc extends Bloc<void> {
  CounterBloc() : super(null);
}

class CountEvent extends Event<void> {
  @override
  FutureOr<void> proceed() async {
    for (int i = 0; i < 5; i++) {
      print(i.toString());
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
