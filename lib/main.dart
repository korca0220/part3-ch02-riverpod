import 'package:ch02_fastcampus_riverpod/async_notifier/my_async_notifier_provider.dart';
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
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(builder: (context, ref, _) {
                  final count = ref.watch(counterAsyncNotifierProvider);

                  return count.when(
                    data: (data) => Text('Data: $data'),
                    error: (error, stack) => Text('Error: $error'),
                    loading: () => const CircularProgressIndicator(),
                  );
                }),
              ],
            ),
          ),
        ),
        // floatingActionButton: Consumer(
        //   builder: (context, ref, _) {
        //     return FloatingActionButton(
        //       onPressed: () {
        //         ref.read(counterNotifierProvider.notifier).increment();
        //       },
        //       child: const Icon(Icons.add),
        //     );
        //   },
        // ),
      ),
    );
  }
}
