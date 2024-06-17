import 'package:ch02_fastcampus_riverpod/state_provider/my_state_provider.dart';
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
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final counter = ref.watch(counterStateProvider);

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
              ref
                  .read(counterStateProvider.notifier)
                  .update((value) => value += 1);
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
