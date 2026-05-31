// features/search/domain/usecases/search_movies.dart
import 'package:movie_discovery/core/usecases/usecase.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';
import 'package:movie_discovery/features/search/domain/repositories/search_repository.dart';

class SearchMovies implements UseCase<List<Movie>, String> {
  final SearchRepository repository;

  SearchMovies(this.repository);

  @override
  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
