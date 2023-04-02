import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_management_state/provider_state_notifier/state/my_home_state.dart';

class MyHomePageStateNotifier extends StateNotifier<MyHomePageState> {
  MyHomePageStateNotifier() : super(const MyHomePageState());

  void increment() {
    state = state.copyWith(state.counter + 1);
  }

  void reBuild() {
    state = const MyHomePageState();
  }
}
