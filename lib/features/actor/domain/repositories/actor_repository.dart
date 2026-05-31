// features/actor/domain/repositories/actor_repository.dart
import '../entities/actor_entity.dart';

abstract class ActorRepository {
  Future<List<ActorEntity>> getMovieCast(int movieId);
  Future<ActorEntity> getActorDetails(int actorId);
}
