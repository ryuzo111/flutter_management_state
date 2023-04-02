import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_management_state/riverpod/riverpod/state/my_home_state.dart';
import 'package:flutter_management_state/riverpod/riverpod/view_model/my_home_view_mode.dart';
import 'package:flutter_management_state/riverpod/main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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

class WidgetB extends ConsumerWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('bをびるど');
    final int counter = ref.watch(myHomePageProvider).counter;
    // final int counter =
    //     context.select<MyHomePageState, int>((state) => state.counter);
    return Text(
      '${counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends ConsumerWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final Function increment = context.read<MyHomePageState>().increment;
    final Function increment = ref.read(myHomePageProvider.notifier).increment;
    print('cをびるど');
    return ElevatedButton(
        child: Text('カウンター'),
        onPressed: () {
          increment();
        });
  }
}
