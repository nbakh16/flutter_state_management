import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/view_types/3_home_page_stateful_consumer.dart';
import 'package:flutter_state_management/view_types/2_home_page_stateless.dart';
import 'view_types/1_home_page.dart';

///Types of Provides
//Provider, read-only widget
final nameProvider = Provider<String>((ref) => 'String');

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
      home: HomePage(),
      // home: HomePageStateless(),
      // home: HomePageStateful(),
    );
  }
}
