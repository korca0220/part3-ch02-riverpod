import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    // 여기다가 ref로 결합이 가능하다.
    return 0;
  }

  increment() {
    state++;
  }
}
