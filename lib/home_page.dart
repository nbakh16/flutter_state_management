import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final counterStateProvider = StateProvider((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child: Text(
          value.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterStateProvider.notifier).state--,
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
            onPressed: () => ref.read(counterStateProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
