import 'package:flutter/material.dart';
import 'package:flutter_management_state/provider/main.dart';
import 'package:flutter_management_state/inherited_widget/main.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class MyProviderV2App extends StatelessWidget {
  const MyProviderV2App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyHomePageState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutterラボ'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePageState extends ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }

  void reBuild() {
    notifyListeners();
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('aをびるど');
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('bをびるど');
    // final int counter = context.watch<MyHomePageState>().counter;
    final int counter =
        context.select<MyHomePageState, int>((state) => state.counter);
    return Text(
      '${counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Function increment = context.read<MyHomePageState>().increment;
    final Function increment = context.read<MyHomePageState>().reBuild;
    print('cをびるど');
    return ElevatedButton(
        child: Text('カウンター'),
        onPressed: () {
          increment();
        });
  }
}
