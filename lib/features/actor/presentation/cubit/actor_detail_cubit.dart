// features/actor/presentation/cubit/actor_detail_cubit.dart
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'actor_detail_state.dart';

// class ActorDetailCubit extends Cubit<ActorDetailState> {
//   final GetActorlUseCase getActorDetailUseCase;

//   ActorDetailCubit(this.getActorDetailUseCase) : super(ActorDetailInitial());

//   Future<void> loadActor(int actorId) async {
//     emit(ActorDetailLoading());

//     try {
//       final actor = await getActorDetailUseCase(actorId);

//       emit(ActorDetailLoaded(actor));
//     } catch (e) {
//       emit(ActorDetailError(e.toString()));
//     }
//   }
// }
