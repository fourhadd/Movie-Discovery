// features/media_detail/presentation/widgets/detail_overview.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/media_detail/domain/entities/movie_detail.dart';

class DetailOverview extends StatelessWidget {
  final MovieDetail movie;
  const DetailOverview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: movie.genres.map((genre) {
              return Chip(
                label: Text(genre, style: const TextStyle(fontSize: 12)),
                backgroundColor: AppTheme.cardDark,
                side: BorderSide.none,
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          const Text(
            'Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            movie.overview,
            style: const TextStyle(
              color: AppTheme.textGrey,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
