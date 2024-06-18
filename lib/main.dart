import 'package:ch02_fastcampus_riverpod/change_notifier_provider/my_change_notifier_provider.dart';
import 'package:ch02_fastcampus_riverpod/state_notifier_provider/my_state_notifier_provider.dart';
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
      home: MyTwoPage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final counter = ref.watch(counterStateNotifierProvider);

          return Text(
            "$counter",
            style: const TextStyle(
              fontSize: 20,
            ),
          );
        }),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              ref.read(counterStateNotifierProvider.notifier).increment();
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

class MyTwoPage extends StatelessWidget {
  const MyTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(counterChangeNotifierProvider);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('카운터 값: ${counter.counterValue}'),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterChangeNotifierProvider.notifier)
                        .increment();
                  },
                  child: const Text('증가'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterChangeNotifierProvider.notifier)
                        .decrement();
                  },
                  child: const Text('감소'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
