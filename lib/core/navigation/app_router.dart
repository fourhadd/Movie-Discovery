// core/navigation/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  // Marşrut adlarını idarə etmək üçün sabitlər
  static const String home = '/';
  static const String movieDetails = '/movie-details/:id';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true, // Konsolda naviqasiya loqlarını görmək üçün
    routes: [
      // 1. Ana Səhifə (Home)
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),

      // 2. Film Detalları Səhifəsi (Növbəti addımda dolduracağıq)
      /*
      GoRoute(
        path: '/movie-details/:id',
        builder: (BuildContext context, GoRouterState state) {
          final movieId = int.parse(state.pathParameters['id']!);
          return MovieDetailsPage(movieId: movieId);
        },
      ),
      */
    ],
  );
}
