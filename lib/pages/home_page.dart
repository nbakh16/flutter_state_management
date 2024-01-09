import 'package:flutter/material.dart';
import 'package:flutter_state_management/pages/profile_page.dart';
import 'package:flutter_state_management/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.go('/settings');
                context.goNamed(SettingsPage.routeName);
              },
              child: const Text('Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                // context.go('/profile');
                context.goNamed(
                  ProfilePage.routeName,
                  pathParameters: {'name': 'Ali'},
                );
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
