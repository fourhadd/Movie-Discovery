// features/home/presentation/widgets/home_hero_banner.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';
import 'package:movie_discovery/features/home/presentation/widgets/banner_action_buttons.dart';

class HomeHeroBanner extends StatelessWidget {
  final Movie featuredMovie;
  const HomeHeroBanner({super.key, required this.featuredMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 550,
          width: double.infinity,
          child: Image.network(
            '${AppConstants.originalImageBaseUrl}${featuredMovie.backdropPath}',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return const AppShimmer(
                height: 550,
                width: double.infinity,
                borderRadius: 0,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 550,
                width: double.infinity,
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white54,
                    size: 50,
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 550,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                AppTheme.backgroundDark.withValues(alpha: 0.8),
                AppTheme.backgroundDark,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                "SCI-FI EPIC • ${featuredMovie.releaseDate.split('-')[0]}",
                style: const TextStyle(
                  color: AppTheme.primaryRed,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  featuredMovie.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BannerActionButtons(movie: featuredMovie),
            ],
          ),
        ),
      ],
    );
  }
}
