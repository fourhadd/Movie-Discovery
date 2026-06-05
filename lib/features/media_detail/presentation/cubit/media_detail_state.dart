// features/media_detail/presentation/cubit/media_detail_state.dart
import 'package:equatable/equatable.dart';
import '../../../home/domain/entities/movie.dart';
import '../../domain/entities/cast.dart';
import '../../domain/entities/movie_detail.dart';

abstract class MediaDetailState extends Equatable {
  const MediaDetailState();

  @override
  List<Object?> get props => [];
}

class MediaDetailInitial extends MediaDetailState {}

class MediaDetailLoading extends MediaDetailState {
  
}

class MediaDetailLoaded extends MediaDetailState {
  final MovieDetail movieDetail;
  final List<Cast> cast;
  final List<Movie> similarMovies;
  final String trailerKey;

  const MediaDetailLoaded({
    required this.movieDetail,
    required this.cast,
    required this.similarMovies,
    required this.trailerKey,
  });

  @override
  List<Object?> get props => [movieDetail, cast, similarMovies, trailerKey];
}

class MediaDetailError extends MediaDetailState {
  final String message;
  const MediaDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
