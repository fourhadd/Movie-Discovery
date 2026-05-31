// features/actor/data/models/actor_model.dart
import '../../domain/entities/actor_entity.dart';

class ActorModel extends ActorEntity {
  const ActorModel({
    required super.id,
    required super.name,
    super.profilePath,
    super.character,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_path': profilePath,
      'character': character,
    };
  }
}
