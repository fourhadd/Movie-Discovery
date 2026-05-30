// features/home/data/repositories/movie_repository_impl.dart
import '../../../../core/errors/failures.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/home_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final HomeRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getTrendingMovies() async {
    try {
      final remoteMovies = await remoteDataSource.getTrendingMovies();
      return remoteMovies;
    } catch (e) {
      throw ServerFailure(
        'Trend filmlər yüklənərkən xəta oldu: ${e.toString()}',
      );
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final remoteMovies = await remoteDataSource.getPopularMovies();
      return remoteMovies;
    } catch (e) {
      throw ServerFailure(
        'Populyar filmlər yüklənərkən xəta oldu: ${e.toString()}',
      );
    }
  }
}
