import 'dart:async';

import 'package:bloc_supreme/bloc_supreme.dart';
import 'package:flutter/material.dart';

class CounterBloc extends Bloc<void> {
  CounterBloc() : super(null);
}

class CountEvent extends Event<void> {
  @override
  FutureOr<void> proceed() async {
    for (int i = 0; i < 5; i++) {
      debugPrint(i.toString());
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}

void main() {
  runApp(const MyApp());
  CounterBloc()
    ..execute(CountEvent())
    ..execute(CountEvent());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
