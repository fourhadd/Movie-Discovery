// features/home/presentation/widgets/movie_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/movie-details/${movie.id}');
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            '${AppConstants.imageBaseUrl}${movie.posterPath}',
            fit: BoxFit.cover,
            loadingBuilder:
                (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return const AppShimmer(
                    width: 130,
                    height: double.infinity,
                    borderRadius: 12,
                  );
                },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[800],
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 40,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
