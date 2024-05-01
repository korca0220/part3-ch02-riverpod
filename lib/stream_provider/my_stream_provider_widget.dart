import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'simple_stream_provider.dart';

class MyStreamProviderWidget extends ConsumerWidget {
  const MyStreamProviderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(simpleStreamProvider);
    return switch (counter) {
      AsyncData(:final value) => Text("$value"),
      AsyncError(:final error) => Text("$error"),
      _ => Text("로딩중"),
    };
  }
}
