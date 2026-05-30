// features/home/presentation/widgets/movie_card.dart

import 'package:flutter/material.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(
            '${AppConstants.imageBaseUrl}${movie.posterPath}',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
