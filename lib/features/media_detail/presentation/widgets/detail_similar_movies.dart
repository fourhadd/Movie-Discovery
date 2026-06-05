// features/media_detail/presentation/widgets/detail_similar_movies.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';

class DetailSimilarMovies extends StatelessWidget {
  final List<Movie> movies;
  const DetailSimilarMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Text(
            'Similar Movies',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  context.pushReplacement('/movie-details/${movie.id}');
                },
                child: Container(
                  width: 110,
                  margin: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: movie.posterPath.isNotEmpty
                        ? Image.network(
                            '${AppConstants.imageBaseUrl}${movie.posterPath}',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const AppShimmer(
                                width: 110,
                                height: double.infinity,
                                borderRadius: 8,
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color: AppTheme.cardDark,
                                  child: Center(
                                    child: Text(
                                      movie.title,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                          )
                        : Container(
                            color: AppTheme.cardDark,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  movie.title,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
