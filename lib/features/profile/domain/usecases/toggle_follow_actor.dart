// features/profile/domain/usecases/toggle_follow_actor.dart
import '../entities/followed_actor.dart';
import '../repositories/profile_repository.dart';

class ToggleFollowActor {
  final ProfileRepository repository;

  const ToggleFollowActor(this.repository);

  Future<bool> call(FollowedActor actor) async {
    return await repository.toggleFollowActor(actor);
  }
}
