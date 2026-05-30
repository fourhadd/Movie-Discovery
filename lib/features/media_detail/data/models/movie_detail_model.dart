// features/media_detail/data/models/movie_detail_model.dart
import '../../domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.posterPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime'] ?? 0,
      genres:
          (json['genres'] as List?)
              ?.map((genre) => genre['name'] as String)
              .toList() ??
          [],
    );
  }
}
