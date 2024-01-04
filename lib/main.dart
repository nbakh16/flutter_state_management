import 'package:flutter/material.dart';
import 'package:flutter_state_management/app_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //     create: (BuildContext context) => AppProvider(),
  //     child: const MyApp()
  //   )
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
