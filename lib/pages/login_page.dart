import 'package:flutter/material.dart';
import 'package:flutter_state_management/pages/home_page.dart';
import 'package:go_router/go_router.dart';

import '../data/data.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'home';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // context.go('/settings');
                isLoggedIn = true;
                context.goNamed(HomePage.routeName);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
