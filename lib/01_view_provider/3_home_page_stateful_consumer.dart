import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

class HomePageStateful extends ConsumerStatefulWidget {
  const HomePageStateful({super.key});

  @override
  ConsumerState<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends ConsumerState<HomePageStateful> {
  late final String name;

  ///we can use ref.read here. initState() or custom method
  @override
  void initState() {
    name = ref.read(nameProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
