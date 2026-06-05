// features/profile/presentation/cubit/profile_state.dart
import '../../domain/entities/user_profile.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfile userProfile;
  const ProfileLoaded({required this.userProfile});
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});
}
