import 'package:flutter/material.dart';
import 'package:flutter_management_state/riverpod/riverpod/state/my_home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePageStateNotifier extends StateNotifier<MyHomePageState> {
  MyHomePageStateNotifier() : super(const MyHomePageState());

  void increment() {
    state = state.copyWith(state.counter + 1);
  }

  void reBuild() {
    state = const MyHomePageState();
  }
}
