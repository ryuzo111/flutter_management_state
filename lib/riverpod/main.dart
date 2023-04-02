import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_management_state/riverpod/riverpod/screen/my_home_page.dart';
import 'package:flutter_management_state/riverpod/riverpod/view_model/my_home_view_mode.dart';
import 'package:flutter_management_state/riverpod/riverpod/state/my_home_state.dart';

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
      home: const MyHomePage(),
    );
  }
}

final myHomePageProvider =
    StateNotifierProvider<MyHomePageStateNotifier, MyHomePageState>(
        (ref) => MyHomePageStateNotifier());
