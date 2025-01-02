import 'package:flutter/material.dart';
import 'package:flutter_state_management/presentation/screens/counter_screen.dart';
import 'package:flutter_state_management/presentation/screens/second_screen.dart';

class AppRouter {
  AppRouter._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const CounterScreen());
      case '/second':
        return MaterialPageRoute(builder: (_) => const SecondScreen());
      default:
        return MaterialPageRoute(builder: (_) => const CounterScreen());
    }
  }
}
