// features/search/domain/repositories/search_repository.dart
import '../../data/models/search_result_model.dart';

abstract class SearchRepository {
  Future<List<SearchResultModel>> searchMulti(String query);
  Future<List<Map<String, dynamic>>> getGenres();
}
