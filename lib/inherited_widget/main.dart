// import 'dart:js';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyInheritedPage extends StatefulWidget {
  const MyInheritedPage({super.key, required this.title});

  final String title;

  @override
  State<MyInheritedPage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyInheritedPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyHomePageInheritedWidget(
      data: this,
      counter: counter,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyHomePageInheritedWidget extends InheritedWidget {
  const MyHomePageInheritedWidget(
      {Key? key,
      required Widget child,
      required this.data,
      required this.counter})
      : super(key: key, child: child);

  final MyHomePageState data;
  final int counter;
  static MyHomePageState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return (context
              .dependOnInheritedWidgetOfExactType<MyHomePageInheritedWidget>())!
          .data;
    } else {
      return (context
              .getElementForInheritedWidgetOfExactType<
                  MyHomePageInheritedWidget>()!
              .widget as MyHomePageInheritedWidget)
          .data;
    }
  }

  @override
  bool updateShouldNotify(MyHomePageInheritedWidget oldWidget) {
    return true;
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
    final MyHomePageState state = MyHomePageInheritedWidget.of(context);

    return Text(
      '${state.counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('cをびるど');
    final MyHomePageState state =
        MyHomePageInheritedWidget.of(context, listen: false);
    return ElevatedButton(
        child: Text('カウンター'),
        onPressed: () {
          state.incrementCounter();
        });
  }
}
