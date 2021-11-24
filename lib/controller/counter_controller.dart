import 'package:flutter/material.dart';
import 'package:reactive_state_example/core/injector.dart';

class CounterController with Disposable {
  final counter = ValueNotifier(0);

  @override
  void dispose() {
    counter.dispose();
  }
}
