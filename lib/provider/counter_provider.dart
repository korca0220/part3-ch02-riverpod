import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter {
  int counterValue = 0;

  increment() {
    counterValue++;
    print(counterValue);
  }
}

final counterProvider = Provider<Counter>(
  (ref) => Counter(),
);
