import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifierProvider =
    AsyncNotifierProvider<CounterAsyncNotifier, int>(
  CounterAsyncNotifier.new,
);

// functional base
final tmpUserCountProvider = FutureProvider((ref) async {
  Dio dio = Dio();
  final result = await dio.get("https://jsonplaceholder.typicode.com/users");

  final users = result.data as List<dynamic>;

  return users.length;
});

class CounterAsyncNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    Dio dio = Dio();
    final result = await dio.get("https://jsonplaceholder.typicode.com/users");
    print(result.data);

    final users = result.data as List<dynamic>;

    return users.length;
  }

  sampleMethod() {
    state = const AsyncValue.loading();
  }
}
