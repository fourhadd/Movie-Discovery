// features/watchlist/data/datasources/watchlist_local_data_source.dart
import 'package:get_storage/get_storage.dart';
import '../../../../features/home/data/models/movie_model.dart';

abstract class WatchlistLocalDataSource {
  Future<void> saveMovie(MovieModel movie);
  Future<void> removeMovie(int movieId);
  List<MovieModel> getWatchlist();
  bool isSaved(int movieId);
}

class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  final GetStorage _storage = GetStorage('WatchlistStorage');
  final String _key = 'my_watchlist';

  @override
  Future<void> saveMovie(MovieModel movie) async {
    final List<dynamic> currentData = _storage.read(_key) ?? [];
    final List<Map<String, dynamic>> currentMovies =
        List<Map<String, dynamic>>.from(currentData);

    if (!currentMovies.any((m) => m['id'] == movie.id)) {
      currentMovies.add(movie.toJson());
      await _storage.write(_key, currentMovies);
    }
  }

  @override
  Future<void> removeMovie(int movieId) async {
    final List<dynamic> currentData = _storage.read(_key) ?? [];
    final List<Map<String, dynamic>> currentMovies =
        List<Map<String, dynamic>>.from(currentData);

    currentMovies.removeWhere((m) => m['id'] == movieId);
    await _storage.write(_key, currentMovies);
  }

  @override
  List<MovieModel> getWatchlist() {
    final List<dynamic> currentData = _storage.read(_key) ?? [];
    return currentData
        .map((json) => MovieModel.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  @override
  bool isSaved(int movieId) {
    final List<dynamic> currentData = _storage.read(_key) ?? [];
    return currentData.any((m) => m['id'] == movieId);
  }
}
