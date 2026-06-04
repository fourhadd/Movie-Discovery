// features/home/presentation/cubit/home_state.dart
import 'package:equatable/equatable.dart';
import '../../domain/entities/movie.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> trendingMovies;
  final List<Movie> popularMovies;
  final bool isImagesLoaded;

  const HomeLoaded({
    required this.trendingMovies,
    required this.popularMovies,
    this.isImagesLoaded = false,
  });

  HomeLoaded copyWith({
    List<Movie>? trendingMovies,
    List<Movie>? popularMovies,
    bool? isImagesLoaded,
  }) {
    return HomeLoaded(
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      isImagesLoaded: isImagesLoaded ?? this.isImagesLoaded,
    );
  }

  @override
  List<Object> get props => [trendingMovies, popularMovies, isImagesLoaded];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
