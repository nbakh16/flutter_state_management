import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/02_view_stateProvider/1_home_page_stateProvider.dart';
import 'package:flutter_state_management/03_view_stateNotifier/1_home_page_stateNotifier.dart';
import 'package:flutter_state_management/model/user_model.dart';
import '01_view_provider/1_home_page.dart';
import '01_view_provider/2_home_page_stateless.dart';
import '01_view_provider/3_home_page_stateful_consumer.dart';

///Types of Provides
//Provider, read-only widget
final nameProvider = Provider<String>((ref) => 'String');
//StateProvider
final nameStateProvider = StateProvider<String?>((ref) => null);
//StateNotifier and StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);

//
//
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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
      home: HomePageStateNotifier(),
    );
  }
}
