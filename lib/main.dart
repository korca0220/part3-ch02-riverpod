import 'package:ch02_fastcampus_riverpod/provider/counter_consumer_widget.dart';
import 'package:ch02_fastcampus_riverpod/provider/counter_provider.dart';
import 'package:ch02_fastcampus_riverpod/provider/counter_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CounterWidget(),
          const CounterStatefulWidget(),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider).decrement();
                },
                child: const Text('감소시키기'),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final counter = ref.read(counterProvider);

          return FloatingActionButton(
            onPressed: () {
              counter.increment();
            },
            child: const Icon(
              Icons.add,
            ),
          );
        },
      ),
    );
  }
}
