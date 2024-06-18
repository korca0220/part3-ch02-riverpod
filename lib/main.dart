import 'package:ch02_fastcampus_riverpod/notifier_provider/my_notifer_provider.dart';
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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, _) {
                final count = ref.watch(counterNotifierProvider);

                return Text("$count");
              }),
            ],
          ),
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, _) {
            return FloatingActionButton(
              onPressed: () {
                ref.read(counterNotifierProvider.notifier).increment();
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
