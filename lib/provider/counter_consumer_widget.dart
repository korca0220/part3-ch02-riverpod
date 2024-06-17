import 'package:ch02_fastcampus_riverpod/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterProvider);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          counter.increment();
        },
        child: const Text('증가시키키'),
      ),
    );
  }
}
