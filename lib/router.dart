import 'package:flutter/cupertino.dart';
import 'package:smart_home_bl/app_scaffold.dart';
import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/main.dart';
import 'package:smart_home_bl/view/pages/landing/landing.dart';
import 'package:smart_home_bl/view/pages/settings/settings.dart';

import 'view/page_scaffold.dart';

class ScreenPaths {
  static String landing = '/';
  static String home = '/home';
  static String settings = '/settings';
}

/// Routing table, matches string paths to UI Screens
final appRouter = GoRouter(redirect: _handleRedirect, routes: [
  ShellRoute(
    builder: (_, __, child) {
      return AppScaffold(child: child);
    },
    routes: [
      AppRoute(ScreenPaths.landing, (_) => const LandingPage()),
      //AppRoute(ScreenPaths.home, (_) => PageScaffold()),
      AppRoute(ScreenPaths.settings, (_) => const SettingsPage()),

      GoRoute(
        path: ScreenPaths.home,
        builder: (context, state) {
          int? arg = state.extra as int?;

          arg ??= 0;
          return PageScaffold(initialTabIndex: arg);
        },
      ),

      
    ],
  )
]);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }

            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}

Future<String?> _handleRedirect(
    BuildContext context, GoRouterState state) async {
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (!appLogic.isBootstrapComplete && state.path != ScreenPaths.landing) {
    return ScreenPaths.landing;
  }
  debugPrint('Navigate to: ${state.path}');
  return null; // do nothing
}
