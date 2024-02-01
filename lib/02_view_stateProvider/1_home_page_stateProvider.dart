import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

///Watching nameProvider by ConsumerWidget
class HomePageStateProvider extends ConsumerWidget {
  const HomePageStateProvider({super.key});

  void onSubmit(String value, WidgetRef ref) {
    //update the value
    ref.read(nameStateProvider.notifier).update((_) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //keep listening
    final name = ref.watch(nameStateProvider) ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) => onSubmit(value, ref),
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
