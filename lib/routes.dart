import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home/presentation/screens/404_page.dart';
import 'package:take_home/presentation/screens/home_page.dart';
import 'package:take_home/presentation/screens/search_page.dart';
import 'package:take_home/presentation/tab_navigation_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");

GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

enum NavRoutes {
  homepage('/'),
  notfound('/not_found'),
  notfoundOne('/not_found_one'),
  notfoundTwo('/not_found_two'),
  searchPage('/search_page');

  const NavRoutes(this.path);

  final String path;
}

class AppRoutes {
  GoRouter get getRoutesConfig => _router;
  //
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: NavRoutes.homepage.path,
    redirect: (context, state) {
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return TabNavigationScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavRoutes.searchPage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return const SearchPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavRoutes.notfound.path,
                builder: (BuildContext context, GoRouterState state) {
                  return const NothingToSeePage();
                },
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavRoutes.homepage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeSliverPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavRoutes.notfoundOne.path,
                builder: (BuildContext context, GoRouterState state) {
                  return const NothingToSeePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: NavRoutes.notfoundTwo.path,
                builder: (BuildContext context, GoRouterState state) {
                  return const NothingToSeePage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
