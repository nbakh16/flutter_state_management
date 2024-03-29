import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/02_view_stateProvider/1_home_page_stateProvider.dart';
import 'package:flutter_state_management/03_view_stateNotifier/1_home_page_stateNotifier.dart';
import 'package:flutter_state_management/04_view_futureProvider/1_home_page_futureProvider.dart';
import 'package:flutter_state_management/logger/logger_riverpod.dart';
import 'package:flutter_state_management/model/user_model.dart';
import 'package:flutter_state_management/repository/user_repo.dart';
import '01_view_provider/1_home_page.dart';
import '01_view_provider/2_home_page_stateless.dart';
import '01_view_provider/3_home_page_stateful_consumer.dart';
import '05_view_streamProvider/1_home_page_streamProvider.dart';

///Types of Provides
//Provider, read-only widget
final nameProvider = Provider<String>((ref) => 'String');
//StateProvider
final nameStateProvider = StateProvider<String?>((ref) => null);
//StateNotifier and StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);
//ChangeNotifier and ChangeNotifierProvider **NOT recommended to user, according to docs
//Only provider which is ***mutable
final userChangeNotifier = ChangeNotifierProvider(
  (ref) => UserNotifierChange(),
);
//Future Provider, based on http calls
final fetchUserProvider = FutureProvider((ref) {
  final userRepository = ref.watch(userRepoProvider);
  return userRepository.getUserData();
});
//Stream Provider
final userStreamProvider = StreamProvider((ref) async* {
  for (int i = 0; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
});
//
//
void main() {
  runApp(
    ProviderScope(
      observers: [LoggerRiverpod()], //track providers on console
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: HomePageStateless(),
      // home: HomePageStateful(),
      // home: HomePageStateProvider(),
      // home: HomePageStateNotifier(),
      // home: HomePageFutureProvider(),
      home: HomePageSteamProvider(),
    );
  }
}
