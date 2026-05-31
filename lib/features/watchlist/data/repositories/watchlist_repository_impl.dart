// features/watchlist/data/repositories/watchlist_repository_impl.dart
import '../../../../features/home/data/models/movie_model.dart';
import '../../../../features/home/domain/entities/movie.dart';
import '../../domain/repositories/watchlist_repository.dart';
import '../datasources/watchlist_local_data_source.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistLocalDataSource localDataSource;

  WatchlistRepositoryImpl({required this.localDataSource});

  @override
  Future<void> saveMovie(Movie movie) async {
    final movieModel = MovieModel(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
      backdropPath: movie.backdropPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
    );
    await localDataSource.saveMovie(movieModel);
  }

  @override
  Future<void> removeMovie(int movieId) async {
    await localDataSource.removeMovie(movieId);
  }

  @override
  List<Movie> getWatchlist() {
    return localDataSource.getWatchlist();
  }

  @override
  bool isSaved(int movieId) {
    return localDataSource.isSaved(movieId);
  }
}
