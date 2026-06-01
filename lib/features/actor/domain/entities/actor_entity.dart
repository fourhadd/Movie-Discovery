// features/actor/domain/entities/actor_entity.dart
import '../../../home/domain/entities/movie.dart';

class ActorDetail {
  final int id;
  final String name;
  final String profilePath;
  final String biography;
  final String profession;
  final int movieCount;
  final List<Movie> knownFor;
  final List<String> photos;

  const ActorDetail({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.biography,
    required this.profession,
    required this.movieCount,
    required this.knownFor,
    required this.photos,
  });
}
