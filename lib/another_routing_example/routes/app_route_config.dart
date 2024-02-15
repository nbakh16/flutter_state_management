import 'package:flutter/material.dart';
import 'package:flutter_state_management/another_routing_example/pages/home.dart';
import 'package:flutter_state_management/another_routing_example/pages/profile.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  home,
  profile,
}

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: AppRoutes.home.name,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const HomePage2(),
          );
        },
        routes: [
          GoRoute(
            path: '/profile',
            name: AppRoutes.profile.name,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const ProfilePage2(),
              );
            },
          ),
        ]),
  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
