import 'package:flutter/material.dart';
import 'package:flutter_state_management/another_routing_example/routes/app_route_config.dart';
import 'package:go_router/go_router.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Home'),
          ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutes.profile.name);
                // GoRouter.of(context).pushNamed(RouteName.profile);
              },
              child: Text('Profile'))
        ],
      ),
    );
  }
}
