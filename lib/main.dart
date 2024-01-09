import 'package:flutter/material.dart';
import 'package:flutter_state_management/pages/home_page.dart';
import 'package:flutter_state_management/pages/login_page.dart';
import 'package:flutter_state_management/pages/profile_page.dart';
import 'package:flutter_state_management/pages/settings_display_page.dart';
import 'package:flutter_state_management/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

import 'data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router demo',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  final _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (!isLoggedIn) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/settings',
        name: SettingsPage.routeName,
        builder: (context, state) => const SettingsPage(),
        routes: [
          GoRoute(
            path: 'display_settings',
            name: SettingsDisplayPage.routeName,
            builder: (context, state) => const SettingsDisplayPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/profile/:name',
        name: ProfilePage.routeName,
        builder: (context, state) {
          final String name = state.pathParameters['name']!;
          return ProfilePage(name: name);
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
