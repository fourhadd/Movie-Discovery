// features/actor/domain/entities/actor_entity.dart
import 'package:equatable/equatable.dart';

class ActorEntity extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  final String? character;

  const ActorEntity({
    required this.id,
    required this.name,
    this.profilePath,
    this.character,
  });

  @override
  List<Object?> get props => [id, name, profilePath, character];
}
