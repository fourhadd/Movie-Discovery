// features/watchlist/presentation/pages/watchlist_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/features/watchlist/presentation/widgets/watchlist_grid_shimmer.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/watchlist_cubit.dart';
import '../cubit/watchlist_state.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchlistCubit>().loadWatchlist();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'My Watchlist',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return const WatchlistGridShimmer();
          }
          if (state is WatchlistLoaded) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text(
                  'Yaddaşda heç bir film yoxdur 🍿',
                  style: TextStyle(color: AppTheme.textGrey, fontSize: 16),
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                  onTap: () => context.push('/movie-details/${movie.id}'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.cardDark,
                      image: movie.posterPath.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(
                                '${AppConstants.imageBaseUrl}${movie.posterPath}',
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: movie.posterPath.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
