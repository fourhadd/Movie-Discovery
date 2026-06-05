// features/search/data/repositories/search_repository_impl.dart
import 'package:movie_discovery/core/errors/failures.dart';
import '../datasources/search_remote_data_source.dart';
import '../../domain/repositories/search_repository.dart';
import '../models/search_result_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<SearchResultModel>> searchMulti(String query) async {
    try {
      return await remoteDataSource.searchMulti(query);
    } catch (e) {
      throw ServerFailure('Axtarış uğursuz oldu: ${e.toString()}');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getGenres() async {
    try {
      return await remoteDataSource.getGenres();
    } catch (e) {
      throw ServerFailure('Janrlar gətirilmədi');
    }
  }
}
