// features/profile/domain/entities/user_profile.dart
import 'followed_actor.dart';

class UserProfile {
  final String name;
  final String membershipDate;
  final String profileImage;
  final List<FollowedActor> followedActors;

  const UserProfile({
    required this.name,
    required this.membershipDate,
    required this.profileImage,
    required this.followedActors,
  });
}
