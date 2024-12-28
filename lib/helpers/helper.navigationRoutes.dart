import 'package:dungeonconsole/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  connectWithUsPage,
  authenticationPage,
  dashboardPage,
}

extension AppRouteExtn on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.connectWithUsPage:
        return '/connect';
      case AppRoutes.authenticationPage:
        return '/';
      case AppRoutes.dashboardPage:
        return '/dashboard';
      default:
        return '/unknown';
    }
  }

  String get name {
    switch (this) {
      case AppRoutes.connectWithUsPage:
        return 'connectWithUsPage';
      case AppRoutes.authenticationPage:
        return 'authenticationPage';
      case AppRoutes.dashboardPage:
        return 'dashboardPage';
      default:
        return 'unknown';
    }
  }
}

class NavigationRoutes {
  static final routes = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.connectWithUsPage.path,
        name: AppRoutes.connectWithUsPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const ConnectWithUsPage();
        },
      ),
      GoRoute(
        path: AppRoutes.authenticationPage.path,
        name: AppRoutes.authenticationPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthenticationPage();
        },
      ),
      GoRoute(
        path: AppRoutes.dashboardPage.path,
        name: AppRoutes.dashboardPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const DashboardPage();
        },
      ),
      GoRoute(
        path: '/unknown',
        name: 'unknown',
        builder: (BuildContext context, GoRouterState state) {
          return const UnknownPage();
        },
      ),
    ],
  );
}
