// features/media_detail/data/repositories/media_detail_repository_impl.dart
import '../../../../core/errors/failures.dart';
import '../../../home/domain/entities/movie.dart';
import '../../domain/entities/cast.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/repositories/media_detail_repository.dart';
import '../datasources/media_detail_remote_data_source.dart';

class MediaDetailRepositoryImpl implements MediaDetailRepository {
  final MediaDetailRemoteDataSource remoteDataSource;

  MediaDetailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieDetail> getMovieDetails(int movieId) async {
    try {
      return await remoteDataSource.getMovieDetails(movieId);
    } catch (e) {
      throw ServerFailure('Detallar yüklənərkən xəta: ${e.toString()}');
    }
  }

  @override
  Future<List<Cast>> getMovieCast(int movieId) async {
    try {
      return await remoteDataSource.getMovieCast(movieId);
    } catch (e) {
      throw ServerFailure('Aktyorlar yüklənərkən xəta: ${e.toString()}');
    }
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    try {
      return await remoteDataSource.getSimilarMovies(movieId);
    } catch (e) {
      throw ServerFailure('Oxşar filmlər yüklənərkən xəta: ${e.toString()}');
    }
  }

  @override
  Future<String> getMovieTrailer(int movieId) async {
    try {
      return await remoteDataSource.getMovieTrailer(movieId);
    } catch (e) {
      throw ServerFailure('Trailer linki alınarkən xəta: ${e.toString()}');
    }
  }
}
