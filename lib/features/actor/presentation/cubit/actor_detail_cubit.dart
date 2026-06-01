// features/actor/presentation/cubit/actor_detail_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_actor_detail.dart';
import 'actor_detail_state.dart';

class ActorDetailCubit extends Cubit<ActorDetailState> {
  final GetActorDetail getActorDetailUsecase;

  ActorDetailCubit({required this.getActorDetailUsecase})
    : super(const ActorDetailInitial());

  Future<void> fetchActorDetail(int actorId) async {
    emit(const ActorDetailLoading());

    try {
      final actor = await getActorDetailUsecase.execute(actorId);

      emit(ActorDetailLoaded(actor));
    } catch (e) {
      emit(ActorDetailError(_mapFailureToMessage(e)));
    }
  }

  String _mapFailureToMessage(dynamic error) {
    if (error is Exception) {
      return error.toString().replaceAll('Exception: ', '');
    }
    return 'Gözlənilməz xəta baş verdi. Zəhmət olmasa bir az sonra yenidən yoxlayın.';
  }
}
