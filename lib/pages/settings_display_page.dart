import 'package:flutter/material.dart';

class SettingsDisplayPage extends StatelessWidget {
  static const String routeName = 'settings_display';
  const SettingsDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(title: const Text('Display Settings')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Settings')),
            ElevatedButton(onPressed: () {}, child: const Text('Profile')),
          ],
        ),
      ),
    );
  }
}
