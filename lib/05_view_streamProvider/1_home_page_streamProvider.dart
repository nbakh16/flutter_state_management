import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

class HomePageSteamProvider extends ConsumerWidget {
  const HomePageSteamProvider({super.key});

  //almost same as FutureProvider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(userStreamProvider).when(
        data: (data) {
          return Center(
            child: Text(
              data.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
