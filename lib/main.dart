import 'package:flutter/material.dart';
import 'package:flutter_management_state/provider/main.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MyProviderApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    print('Myhomepagestateをびるど');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const WidgetA(),
            WidgetB(_counter),
            WidgetC(_incrementCounter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
  const WidgetB(this.counter, {Key? key}) : super(key: key);

  final int counter;
  @override
  Widget build(BuildContext context) {
    print('bをびるど');
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC(this.increment, {Key? key}) : super(key: key);
  final Function increment;
  @override
  Widget build(BuildContext context) {
    print('cをびるど');
    return ElevatedButton(
        child: Text('カウンター'),
        onPressed: () {
          this.increment();
        });
  }
}
