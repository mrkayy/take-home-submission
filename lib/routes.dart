import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:take_home/presentation/tab_navigation_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");

GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

enum NavRoutes {
  root('/');

  const NavRoutes(this.path);

  final String path;
}

class AppRoutes {
  GoRouter get getRoutesConfig => _router;
  //
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: NavRoutes.root.path,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: NavRoutes.root.path,
        builder: (context, state) => const Scaffold(),
        routes: <RouteBase>[
          GoRoute(
            path: NavRoutes.splashPageOne.path,
            builder: (context, state) => const Scaffold(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return TabNavigationScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // Home tab routes
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                // parentNavigatorKey: _rootNavigatorKey,
                path: AppRoute.homeTab.path,
                // name: AppRoute.homePage.path,
                builder: (BuildContext context, GoRouterState state) {
                  return HomePage();
                },
                routes: [],
              ),
            ],
          ),
          // Ponds tab routesR
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.activityTab.path,
                builder: (BuildContext context, GoRouterState state) {
                  return ActivitiesPage();
                },
                routes: [],
              ),
            ],
          ),
          //
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: AppRoute.patnersTab.path,
                  // name: AppRoute.orderPage.path,
                  builder: (BuildContext context, GoRouterState state) {
                    return PartnersPage();
                  },
                  routes: []),
            ],
          ),
          //
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(
              path: AppRoute.billinTab.path,
              // name: AppRoute.sellPage.path,
              builder: (BuildContext context, GoRouterState state) {
                return BillingsPage();
              },
            ),
          ]),
        ],
      ),
    ],
  );
}
