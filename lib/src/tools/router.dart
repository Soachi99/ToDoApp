import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/src/features/tasks/presentation/home/home_page.dart';
import 'package:todoapp/src/features/tasks/presentation/splash/splash_page.dart';

class Routes {
  static const String rootRoute = '/';
  static const String home = '/home';
}

final goRouterProvider = Provider<GoRouter>((ref) => router);

final router = GoRouter(initialLocation: '/', routes: <GoRoute>[
  GoRoute(
      path: Routes.rootRoute,
      pageBuilder: (context, state) =>
          page(state: state, child: const SplashPage())),
  GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          page(state: state, child: const HomePage()))
  // GoRoute(
  //   path: Routes.dashboard,
  //   pageBuilder: (context, state) => page(
  //       state: state,
  //       child: MainPage(
  //         pageState: 1,
  //         backgroundScaffold: getThemeManager(context).isDarkMode
  //             ? systemColors.colorsDark[27]
  //             : systemColors.colorsLight[2],
  //         child: const DashboardPage(),
  //       )),
  // ),
]);

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
