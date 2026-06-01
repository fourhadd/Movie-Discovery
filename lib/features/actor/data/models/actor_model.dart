// features/actor/data/models/actor_model.dart
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';

import '../../../home/data/models/movie_model.dart';

class ActorDetailModel extends ActorDetail {
  const ActorDetailModel({
    required super.id,
    required super.name,
    required super.profilePath,
    required super.biography,
    required super.profession,
    required super.movieCount,
    required super.knownFor,
    required super.photos,
  });

  factory ActorDetailModel.fromJson(Map<String, dynamic> json) {
    var movieCreditsList = json['movie_credits']?['cast'] as List? ?? [];
    var movies = movieCreditsList
        .take(10)
        .map((m) => MovieModel.fromJson(m))
        .toList();

    var imagesList = json['images']?['profiles'] as List? ?? [];
    var photoPaths = imagesList
        .map((img) => img['file_path'] as String? ?? '')
        .where((path) => path.isNotEmpty)
        .toList();

    return ActorDetailModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profilePath: json['profile_path'] ?? '',
      biography: json['biography'] ?? 'Bioqrafiya tapılmadı.',
      profession: json['known_for_department'] ?? 'Actor',
      movieCount: movieCreditsList.length,
      knownFor: movies,
      photos: photoPaths,
    );
  }
}
