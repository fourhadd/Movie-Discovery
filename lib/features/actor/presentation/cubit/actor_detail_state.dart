// features/actor/presentation/cubit/actor_detail_state.dart
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';

abstract class ActorDetailState {
  const ActorDetailState();
}

class ActorDetailInitial extends ActorDetailState {
  const ActorDetailInitial();
}

class ActorDetailLoading extends ActorDetailState {
  const ActorDetailLoading();
}

class ActorDetailLoaded extends ActorDetailState {
  final ActorDetail actor;

  const ActorDetailLoaded(this.actor);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorDetailLoaded &&
          runtimeType == other.runtimeType &&
          actor == other.actor;

  @override
  int get hashCode => actor.hashCode;
}

class ActorDetailError extends ActorDetailState {
  final String message;

  const ActorDetailError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorDetailError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
