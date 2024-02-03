import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

///Watching nameProvider by ConsumerWidget
class HomePageStateNotifier extends ConsumerWidget {
  const HomePageStateNotifier({super.key});

  void onSubmit(String value, WidgetRef ref) {
    ref.read(userProvider.notifier).updateName(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    //rebuild widget only when "name" property changes
    //useful when we need to listen to one property of a class
    final userSelect = ref.watch(
      userProvider.select((value) => value.name),
    );

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
              user.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
