// features/media_detail/presentation/cubit/media_detail_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_movie_cast.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_movie_trailer.dart';
import '../../domain/usecases/get_similar_movies.dart';
import 'media_detail_state.dart';

class MediaDetailCubit extends Cubit<MediaDetailState> {
  final GetMovieDetails getMovieDetails;
  final GetMovieCast getMovieCast;
  final GetSimilarMovies getSimilarMovies;
  final GetMovieTrailer getMovieTrailer;

  MediaDetailCubit({
    required this.getMovieDetails,
    required this.getMovieCast,
    required this.getSimilarMovies,
    required this.getMovieTrailer,
  }) : super(MediaDetailInitial());

  Future<void> fetchMediaDetail(int movieId) async {
    emit(MediaDetailLoading());
    try {
      final movieDetail = await getMovieDetails(movieId);
      final cast = await getMovieCast(movieId);
      final similarMovies = await getSimilarMovies(movieId);
      final trailerKey = await getMovieTrailer(movieId).catchError((_) => '');

      emit(
        MediaDetailLoaded(
          movieDetail: movieDetail,
          cast: cast,
          similarMovies: similarMovies,
          trailerKey: trailerKey,
        ),
      );
    } catch (e) {
      emit(MediaDetailError(e.toString()));
    }
  }
}
