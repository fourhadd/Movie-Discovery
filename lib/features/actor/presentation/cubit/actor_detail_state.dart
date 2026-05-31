// features/actor/presentation/cubit/actor_detail_state.dart

import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';

abstract class ActorDetailState {}

class ActorDetailInitial extends ActorDetailState {}

class ActorDetailLoading extends ActorDetailState {}

class ActorDetailLoaded extends ActorDetailState {
  final ActorEntity actor;

  ActorDetailLoaded(this.actor);
}

class ActorDetailError extends ActorDetailState {
  final String message;

  ActorDetailError(this.message);
}
