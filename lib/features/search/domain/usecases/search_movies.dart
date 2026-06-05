// features/search/domain/usecases/search_movies.dart
import '../repositories/search_repository.dart';
import '../../data/models/search_result_model.dart';

class SearchMovies {
  final SearchRepository repository;

  SearchMovies(this.repository);

  Future<List<SearchResultModel>> call(String query) async {
    return await repository.searchMulti(query);
  }
}
