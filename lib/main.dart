import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class Contact {
  final String name;

  const Contact({required this.name});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
