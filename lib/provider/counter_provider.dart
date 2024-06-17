import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter {
  int counterValue = 0;

  increment() {
    counterValue++;
    print('increment : $counterValue');
  }

  decrement() {
    counterValue--;
    print("decrement: $counterValue");
  }
}

final counterProvider = Provider<Counter>(
  (ref) => Counter(),
);
