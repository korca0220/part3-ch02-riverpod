import 'package:riverpod/riverpod.dart';

class Counter {
  int counterValue = 0;

  increment() {
    counterValue++;
    print("increment: $counterValue");
  }

  decrement(){
    counterValue--;
    print("decrement: $counterValue");
  }
}

class Counter2 {
  int counterValue = 1;

  increment() {
    counterValue++;
  }
}

final counterProvider = Provider<Counter>(
  (ref) => Counter(),
);

final counter2Provider = Provider(
  (ref) => Counter2(),
);
