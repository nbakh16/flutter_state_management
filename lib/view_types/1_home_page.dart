import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

///Watching nameProvider by ConsumerWidget
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //keep listening
    final name = ref.watch(nameProvider);

    //get only once, ***NOT recommended using inside build method
    final nameRead = ref.read(nameProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
