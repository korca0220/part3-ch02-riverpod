import 'package:ch02_fastcampus_riverpod/change_notifier_provider/my_change_notifier_provider.dart';
import 'package:ch02_fastcampus_riverpod/state_notifier_provider/my_state_notifier_provider.dart';
import 'package:ch02_fastcampus_riverpod/stream_provider/simple_stream_provider.dart';
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
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final count = ref.watch(counterChangeNotifierProvider).counterValue;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("카운터 값: $count"),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterChangeNotifierProvider.notifier)
                        .increment();
                  },
                  child: const Text("증가"),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(counterChangeNotifierProvider.notifier)
                        .decrement();
                  },
                  child: const Text("감소"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
