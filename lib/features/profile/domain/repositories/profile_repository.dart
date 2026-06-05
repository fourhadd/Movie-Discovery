// features/profile/domain/repositories/profile_repository.dart
import '../entities/followed_actor.dart';
import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<UserProfile> getUserProfile();
  Future<bool> toggleFollowActor(FollowedActor actor);
  Future<bool> isActorFollowed(int actorId);
}
