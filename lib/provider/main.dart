import 'package:flutter/material.dart';
import 'package:flutter_management_state/provider/Counter.dart';
import 'package:provider/provider.dart';

class MyProviderApp extends StatelessWidget {
  const MyProviderApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Sample')),
      body: ChangeNotifierProvider(
        create: (_) => Counter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TextWidgetA(),
            TextWidgetB(),
            TextWidgetC(),
            ButtonWidgetA(),
            ButtonWidgetB(),
            ButtonWidgetC()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TextWidgetA extends StatelessWidget {
  const TextWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built TextWidgetA');

    return Center(
        child: Text(
            'Counter A: ${context.watch<Counter>().countA}', //counterオブジェクトに変更が入ると更新される
            style: const TextStyle(fontSize: 20)));
  }
}

class TextWidgetB extends StatelessWidget {
  const TextWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built TextWidgetB');

    return Center(
        child: Text(
            'Counter B: ${context.read<Counter>().countB}', // readを使用しているため、更新があってもリビルドされず、更新されない
            style: const TextStyle(fontSize: 20)));
  }
}

class TextWidgetC extends StatelessWidget {
  const TextWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built TextWidgetC');

    return Center(
        child: Text(
            'Counter C: ${context.select((Counter counter) => counter.countC)}', //selectはcountCを監視している
            style: const TextStyle(fontSize: 20)));
  }
}

class ButtonWidgetA extends StatelessWidget {
  const ButtonWidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounterA();
            },
            child: const Text('Increment Count A',
                style: TextStyle(fontSize: 20))));
  }
}

class ButtonWidgetB extends StatelessWidget {
  const ButtonWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounterB();
            },
            child: const Text('Increment Count B',
                style: TextStyle(fontSize: 20))));
  }
}

class ButtonWidgetC extends StatelessWidget {
  const ButtonWidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Built ButtonWidgetC');

    return Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounterC();
            },
            child: const Text('Increment Count C',
                style: TextStyle(fontSize: 20))));
  }
}
