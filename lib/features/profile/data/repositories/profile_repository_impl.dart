// features/profile/data/repositories/profile_repository_impl.dart
import '../../domain/entities/followed_actor.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';
import '../models/followed_actor_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  const ProfileRepositoryImpl({required this.localDataSource});

  @override
  Future<UserProfile> getUserProfile() async {
    final List<FollowedActorModel> followedList = localDataSource
        .getFollowedActors();

    return UserProfile(
      name: "Alex Turner",
      membershipDate: "Member since 2023",
      profileImage:
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400",

      followedActors: List<FollowedActor>.from(followedList),
    );
  }

  @override
  Future<bool> toggleFollowActor(FollowedActor actor) async {
    final model = FollowedActorModel(
      id: actor.id,
      name: actor.name,
      profilePath: actor.profilePath,
    );
    return await localDataSource.toggleFollowActor(model);
  }

  @override
  Future<bool> isActorFollowed(int actorId) async {
    return await localDataSource.isActorFollowed(actorId);
  }
}
