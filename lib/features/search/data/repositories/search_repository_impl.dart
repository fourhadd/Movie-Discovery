// features/search/data/repositories/search_repository_impl.dart
import 'package:movie_discovery/core/errors/failures.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';
import 'package:movie_discovery/features/search/data/datasources/search_remote_data_source.dart';
import 'package:movie_discovery/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> searchMovies(String query) async {
    try {
      final movieModels = await remoteDataSource.searchMovies(query);
      return movieModels;
    } catch (e) {
      throw ServerFailure('Axtarış uğursuz oldu: ${e.toString()}');
    }
  }
}
