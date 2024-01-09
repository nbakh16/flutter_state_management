import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile';
  const ProfilePage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
