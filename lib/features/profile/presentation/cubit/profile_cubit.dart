// features/profile/presentation/cubit/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_user_profile.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfile getUserProfileUseCase;

  ProfileCubit({required this.getUserProfileUseCase}) : super(ProfileInitial());

  Future<void> loadUserProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await getUserProfileUseCase();
      emit(ProfileLoaded(userProfile: profile));
    } catch (e) {
      emit(const ProfileError(message: "Profil məlumatları yüklənə bilmədi."));
    }
  }
}
