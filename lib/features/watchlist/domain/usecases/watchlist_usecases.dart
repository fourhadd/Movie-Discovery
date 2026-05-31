// features/watchlist/domain/usecases/watchlist_usecases.dart
import '../../../../features/home/domain/entities/movie.dart';
import '../repositories/watchlist_repository.dart';

class ToggleWatchlist {
  final WatchlistRepository repository;
  ToggleWatchlist(this.repository);

  Future<void> execute(Movie movie) async {
    if (repository.isSaved(movie.id)) {
      await repository.removeMovie(movie.id);
    } else {
      await repository.saveMovie(movie);
    }
  }
}

class GetWatchlistMovies {
  final WatchlistRepository repository;
  GetWatchlistMovies(this.repository);

  List<Movie> execute() => repository.getWatchlist();
}

class CheckWatchlistStatus {
  final WatchlistRepository repository;
  CheckWatchlistStatus(this.repository);

  bool execute(int movieId) => repository.isSaved(movieId);
}
