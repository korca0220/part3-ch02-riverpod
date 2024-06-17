import 'package:ch02_fastcampus_riverpod/future_provider/simple_future_provider.dart';
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
    return const Scaffold(
      body: MyFutureProviderWidget(),
    );
  }
}

class MyFutureProviderWidget extends ConsumerWidget {
  const MyFutureProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intValue = ref.watch(simpleIntFutureProvider);

    return Center( 
      child: intValue.when(
        data: (data) => Text(
          '$data',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        error: (error, stack) => Text(
          '$error',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        loading: () => const Text('로딩중'),
      ),
    );
  }
}
