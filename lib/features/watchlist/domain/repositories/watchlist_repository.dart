// features/watchlist/domain/repositories/watchlist_repository.dart
import '../../../../features/home/domain/entities/movie.dart';

abstract class WatchlistRepository {
  Future<void> saveMovie(Movie movie);
  Future<void> removeMovie(int movieId);
  List<Movie> getWatchlist();
  bool isSaved(int movieId);
}
