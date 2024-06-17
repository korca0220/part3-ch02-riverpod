import 'package:ch02_fastcampus_riverpod/provider/counter_provider.dart';
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
