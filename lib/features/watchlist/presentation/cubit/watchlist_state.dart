// features/watchlist/presentation/cubit/watchlist_state.dart
import 'package:equatable/equatable.dart';
import '../../../../features/home/domain/entities/movie.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();
  @override
  List<Object?> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<Movie> movies;
  const WatchlistLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}
