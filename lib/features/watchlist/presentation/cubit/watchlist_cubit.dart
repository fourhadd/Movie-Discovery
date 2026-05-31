// features/watchlist/presentation/cubit/watchlist_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/watchlist_usecases.dart';
import '../../../../features/home/domain/entities/movie.dart';
import 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final GetWatchlistMovies getWatchlistMovies;
  final ToggleWatchlist toggleWatchlist;
  final CheckWatchlistStatus checkWatchlistStatus;

  WatchlistCubit({
    required this.getWatchlistMovies,
    required this.toggleWatchlist,
    required this.checkWatchlistStatus,
  }) : super(WatchlistInitial());

  void loadWatchlist() {
    emit(WatchlistLoading());
    final movies = getWatchlistMovies.execute();
    emit(WatchlistLoaded(movies));
  }

  Future<void> toggleMovieWatchlist(Movie movie) async {
    await toggleWatchlist.execute(movie);
    loadWatchlist();
  }

  bool isMovieSaved(int movieId) {
    return checkWatchlistStatus.execute(movieId);
  }
}
