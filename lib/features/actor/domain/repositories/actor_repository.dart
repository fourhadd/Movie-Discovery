// features/actor/domain/repositories/actor_repository.dart
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';

abstract class ActorRepository {
  Future<ActorDetail> getActorDetail(int actorId);
}
