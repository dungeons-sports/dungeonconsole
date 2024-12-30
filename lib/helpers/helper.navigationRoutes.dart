import 'package:dungeonconsole/pages/Authentication/SignUp/page.signup.dart';
import 'package:dungeonconsole/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  connectWithUsPage,
  loginPage,
  signupPage,
  dashboardPage,
  partnerWithUs,
}

extension AppRouteExtn on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.connectWithUsPage:
        return '/connect';
      case AppRoutes.loginPage:
        return '/login';
      case AppRoutes.signupPage:
        return '/signup';
      case AppRoutes.dashboardPage:
        return '/dashboard';
      case AppRoutes.partnerWithUs:
        return '/register';
      default:
        return '/unknown';
    }
  }

  String get name {
    switch (this) {
      case AppRoutes.connectWithUsPage:
        return 'connectWithUsPage';
      case AppRoutes.loginPage:
        return 'loginPage';
      case AppRoutes.signupPage:
        return 'signupPage';
      case AppRoutes.dashboardPage:
        return 'dashboardPage';
      case AppRoutes.partnerWithUs:
        return 'partnerWithUsPage';
      default:
        return 'unknown';
    }
  }
}

class NavigationRoutes {
  static final routes = GoRouter(
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.connectWithUsPage.path,
        name: AppRoutes.connectWithUsPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const ConnectWithUsPage();
        },
      ),
      GoRoute(
        path: AppRoutes.loginPage.path,
        name: AppRoutes.loginPage.name,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: AppRoutes.signupPage.path,
        name: AppRoutes.signupPage.name,
        builder: (BuildContext context, GoRouterState state) {
          final isPartner = state.uri.queryParameters['isPartner'] == null? false : true;
          return SignupPage(isPartner: isPartner);
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
        path: AppRoutes.partnerWithUs.path,
        name: AppRoutes.partnerWithUs.name,
        builder: (BuildContext context, GoRouterState state) {
          return const PartnerWithUsPage();
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
