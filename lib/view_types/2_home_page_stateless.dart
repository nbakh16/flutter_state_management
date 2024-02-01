import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

///Watching nameProvider by Consumer builder in StatelessWidget
class HomePageStateless extends StatelessWidget {
  const HomePageStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Text(
            name,
            style: Theme.of(context).textTheme.titleLarge,
          );
        }),
      ),
    );
  }
}
