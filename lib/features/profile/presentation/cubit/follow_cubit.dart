// features/profile/presentation/cubit/follow_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/domain/entities/followed_actor.dart';
import '../../../profile/domain/usecases/is_actor_followed.dart';
import '../../../profile/domain/usecases/toggle_follow_actor.dart';

class FollowCubit extends Cubit<bool> {
  final ToggleFollowActor toggleFollowActor;
  final IsActorFollowed isActorFollowedUseCase;

  FollowCubit({
    required this.toggleFollowActor,
    required this.isActorFollowedUseCase,
  }) : super(false);

  void checkFollowStatus(int actorId) async {
    try {
      final isFollowed = await isActorFollowedUseCase(actorId);
      emit(isFollowed);
    } catch (_) {
      emit(false);
    }
  }

  void toggleFollow(FollowedActor actor) async {
    try {
      final isFollowed = await toggleFollowActor(actor);
      emit(isFollowed);
    } catch (_) {}
  }
}
