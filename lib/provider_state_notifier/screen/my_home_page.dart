import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_management_state/provider_state_notifier/state/my_home_state.dart';
import 'package:flutter_management_state/provider_state_notifier/view_model/my_home_view_mode.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyHomePageStateNotifier, MyHomePageState>(
      create: (context) => MyHomePageStateNotifier(),
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
    final int counter = context.watch<MyHomePageState>().counter;
    // final int counter =
    //     context.select<MyHomePageState, int>((state) => state.counter);
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
    final Function increment =
        context.read<MyHomePageStateNotifier>().increment;
    print('cをびるど');
    return ElevatedButton(
        child: Text('カウンター'),
        onPressed: () {
          increment();
        });
  }
}
