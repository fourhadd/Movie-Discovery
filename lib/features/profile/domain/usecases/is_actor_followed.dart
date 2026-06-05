// features/profile/domain/usecases/is_actor_followed.dart
import '../repositories/profile_repository.dart';

class IsActorFollowed {
  final ProfileRepository repository;

  const IsActorFollowed(this.repository);

  Future<bool> call(int actorId) async {
    return await repository.isActorFollowed(actorId);
  }
}
