// core/navigation/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/core/navigation/main_wrapper.dart';
import 'package:movie_discovery/di/injection.dart';
import 'package:movie_discovery/features/actor/presentation/cubit/actor_detail_cubit.dart';
import 'package:movie_discovery/features/actor/presentation/pages/actor_detail_page.dart';
import 'package:movie_discovery/features/home/presentation/pages/home_page.dart';
import 'package:movie_discovery/features/media_detail/presentation/pages/movie_detail_page.dart';
import 'package:movie_discovery/features/search/presentation/pages/search_page.dart';
import 'package:movie_discovery/features/watchlist/presentation/pages/watchlist_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    backgroundColor: Colors.black,
    body: Center(
      child: Text('Profile Page', style: TextStyle(color: Colors.white)),
    ),
  );
}

class AppRouter {
  static const String home = '/';
  static const String movieDetails = '/movie-details/:id';
  static const String actorDetails = '/actor-details/:id';

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: home,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return MainWrapper(navigationShell: navigationShell);
            },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                builder: (BuildContext context, GoRouterState state) =>
                    SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/watchlist',
                builder: (BuildContext context, GoRouterState state) =>
                    const WatchlistPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: movieDetails,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          final movieId = int.parse(state.pathParameters['id']!);
          return MovieDetailPage(movieId: movieId);
        },
      ),
      GoRoute(
        path: actorDetails,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) {
          final actorId = int.parse(state.pathParameters['id']!);

          return BlocProvider<ActorDetailCubit>(
            create: (context) =>
                sl<ActorDetailCubit>()..fetchActorDetail(actorId),
            child: ActorDetailPage(actorId: actorId),
          );
        },
      ),
    ],
  );
}
