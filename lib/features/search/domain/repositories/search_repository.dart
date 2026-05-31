// features/search/domain/repositories/search_repository.dart
import 'package:movie_discovery/features/home/domain/entities/movie.dart';

abstract class SearchRepository {
  Future<List<Movie>> searchMovies(String query);
}
