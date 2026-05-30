// core/navigation/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/features/media_detail/presentation/pages/movie_detail_page.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const String home = '/';
  static const String movieDetails = '/movie-details/:id';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: movieDetails,
        builder: (BuildContext context, GoRouterState state) {
          final movieId = int.parse(state.pathParameters['id']!);
          return MovieDetailPage(movieId: movieId);
        },
      ),
    ],
  );
}
