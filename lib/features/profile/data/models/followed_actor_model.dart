// features/profile/data/models/followed_actor_model.dart
import '../../domain/entities/followed_actor.dart';

class FollowedActorModel extends FollowedActor {
  const FollowedActorModel({
    required super.id,
    required super.name,
    required super.profilePath,
  });

  factory FollowedActorModel.fromJson(Map<String, dynamic> json) {
    return FollowedActorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profilePath: json['profile_path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'profile_path': profilePath};
  }
}
