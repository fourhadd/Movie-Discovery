// features/media_detail/presentation/widgets/watchlist_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';
import 'package:movie_discovery/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:movie_discovery/features/watchlist/presentation/cubit/watchlist_state.dart';

class WatchlistButton extends StatelessWidget {
  final dynamic movieDetail;

  const WatchlistButton({super.key, required this.movieDetail});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, watchlistState) {
        final isSaved = context.read<WatchlistCubit>().isMovieSaved(
          movieDetail.id,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 54),
              backgroundColor: isSaved
                  ? AppTheme.cardDark
                  : AppTheme.primaryRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            onPressed: () {
              final movieEntity = Movie(
                id: movieDetail.id,
                title: movieDetail.title,
                overview: movieDetail.overview,
                posterPath: movieDetail.posterPath,
                backdropPath: movieDetail.backdropPath,
                voteAverage: movieDetail.voteAverage,
                releaseDate: movieDetail.releaseDate,
              );

              context.read<WatchlistCubit>().toggleMovieWatchlist(movieEntity);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isSaved
                        ? 'Film siyahıdan çıxarıldı.'
                        : 'Film uğurla Watchlist-ə əlavə edildi! 🔥',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  duration: const Duration(milliseconds: 800),
                  backgroundColor: const Color(0xFF1F1F1F),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            icon: Icon(
              isSaved
                  ? Icons.bookmark_added_rounded
                  : Icons.bookmark_add_outlined,
              color: Colors.white,
              size: 22,
            ),
            label: Text(
              isSaved ? 'Remove from Watchlist' : 'Save to Watchlist',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
          ),
        );
      },
    );
  }
}
