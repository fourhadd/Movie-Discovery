// features/media_detail/domain/repositories/media_detail_repository.dart
import '../../../home/domain/entities/movie.dart';
import '../entities/movie_detail.dart';
import '../entities/cast.dart';

abstract class MediaDetailRepository {
  Future<MovieDetail> getMovieDetails(int movieId);

  Future<List<Cast>> getMovieCast(int movieId);

  Future<List<Movie>> getSimilarMovies(int movieId);

  Future<String> getMovieTrailer(int movieId);
}
