import 'package:flutter/material.dart';
import 'package:flutter_state_management/pages/settings_display_page.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = 'settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(SettingsDisplayPage.routeName);
              },
              child: const Text('Display'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
