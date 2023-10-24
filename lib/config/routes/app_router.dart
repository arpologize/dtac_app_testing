import 'package:dtac_app_testing/view/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'route_config.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    errorBuilder: (ctx, state) => Scaffold(
      body: Center(
        child: Text('Error Route: ${state.error}'),
      ),
    ),
    routes: [
      GoRoute(
        path: Routes.mainScreen,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: MainView());
        },
      ),
    ],
  );
});
