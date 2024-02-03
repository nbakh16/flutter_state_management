import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';

class HomePageFutureProvider extends ConsumerWidget {
  const HomePageFutureProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //AsyncValue, replacement for AsyncSnapshot from FutureBuilder
    // final user = ref.watch(fetchUserProvider);

    return ref.watch(fetchUserProvider).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text(
                  data.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  data.email,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
