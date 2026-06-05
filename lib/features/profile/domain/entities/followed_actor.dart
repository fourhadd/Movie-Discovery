// features/profile/domain/entities/followed_actor.dart
class FollowedActor {
  final int id;
  final String name;
  final String profilePath;

  const FollowedActor({
    required this.id,
    required this.name,
    required this.profilePath,
  });
}
