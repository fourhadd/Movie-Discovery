// features/media_detail/presentation/pages/movie_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/media_detail/presentation/widgets/detail_cast_list.dart';
import 'package:movie_discovery/features/media_detail/presentation/widgets/detail_header.dart';
import 'package:movie_discovery/features/media_detail/presentation/widgets/detail_overview.dart';
import 'package:movie_discovery/features/media_detail/presentation/widgets/detail_similar_movies.dart';
import '../cubit/media_detail_cubit.dart';
import '../cubit/media_detail_state.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    context.read<MediaDetailCubit>().fetchMediaDetail(movieId);

    return Scaffold(
      body: BlocBuilder<MediaDetailCubit, MediaDetailState>(
        builder: (context, state) {
          if (state is MediaDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryRed),
            );
          }
          if (state is MediaDetailError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is MediaDetailLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailHeader(
                    movie: state.movieDetail,
                    trailerKey: state.trailerKey,
                  ),
                  DetailOverview(movie: state.movieDetail),
                  DetailCastList(castList: state.cast),
                  DetailSimilarMovies(movies: state.similarMovies),
                  const SizedBox(height: 40),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
