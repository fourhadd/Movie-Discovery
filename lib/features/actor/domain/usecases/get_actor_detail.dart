// features/actor/domain/usecases/get_movie_cast_usecase.dart
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';

import '../repositories/actor_repository.dart';

class GetActorDetail {
  final ActorRepository repository;

  GetActorDetail(this.repository);

  Future<ActorDetail> execute(int actorId) async {
    return await repository.getActorDetail(actorId);
  }
}
