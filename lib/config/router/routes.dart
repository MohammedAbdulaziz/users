import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:users/config/router/router.dart';
import 'package:users/features/users/users.dart';

final routes = [
  GoRoute(
    path: '/',
    name: RoutesName.home,
    parentNavigatorKey: RoutesConfig.navigationKey,
    builder: (context, state) => const UsersScreen(),
    routes: [
      GoRoute(
        path: 'user-detail',
        name: RoutesName.userDetail,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          final User user = state.extra as User;
          return CustomTransitionPage(
            key: state.pageKey,
            child: DetailsScreen(user: user),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: 'list-user',
        name: RoutesName.listUsers,
        parentNavigatorKey: RoutesConfig.navigationKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const UsersScreen(),
            transitionsBuilder: (ctx, animation, animation2, child) {
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  ),
];
