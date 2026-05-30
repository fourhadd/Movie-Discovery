// features/media_detail/domain/entities/movie_detail.dart
import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final int runtime;
  final List<String> genres;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    posterPath,
    voteAverage,
    releaseDate,
    runtime,
    genres,
  ];
}
