import 'package:ch02_fastcampus_riverpod/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStatefulWidget extends ConsumerStatefulWidget {
  const CounterStatefulWidget({super.key});

  @override
  ConsumerState<CounterStatefulWidget> createState() =>
      _CounterStatefulWidgetState();
}

class _CounterStatefulWidgetState extends ConsumerState<CounterStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final counter = ref.read(counterProvider);
        counter.increment();
        setState(() {});
      },
      child: Text('증가시키기 ${ref.read(counterProvider).counterValue}'),
    );
  }
}
