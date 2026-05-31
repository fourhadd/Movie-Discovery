// features/home/presentation/widgets/banner_action_buttons.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:movie_discovery/features/watchlist/presentation/cubit/watchlist_state.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';

class BannerActionButtons extends StatelessWidget {
  final Movie movie;

  const BannerActionButtons({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => context.push('/movie-details/${movie.id}'),
          icon: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
          label: const Text(
            "Ətraflı",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            backgroundColor: AppTheme.primaryRed,
          ),
        ),

        const SizedBox(width: 15),

        BlocBuilder<WatchlistCubit, WatchlistState>(
          builder: (context, state) {
            final isSaved = context.read<WatchlistCubit>().isMovieSaved(
              movie.id,
            );

            return Container(
              decoration: BoxDecoration(
                color: isSaved
                    ? AppTheme.primaryRed.withValues(alpha: 0.2)
                    : Colors.white24,
                borderRadius: BorderRadius.circular(8),
                border: isSaved ? Border.all(color: AppTheme.primaryRed) : null,
              ),
              child: IconButton(
                icon: Icon(
                  isSaved ? Icons.check : Icons.add,
                  color: isSaved ? AppTheme.primaryRed : Colors.white,
                ),
                onPressed: () {
                  context.read<WatchlistCubit>().toggleMovieWatchlist(movie);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isSaved
                            ? 'Film siyahıdan silindi'
                            : 'Film siyahıya əlavə edildi!',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: isSaved
                          ? Colors.grey[800]
                          : AppTheme.primaryRed,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
