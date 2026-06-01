// features/actor/data/repositories/actor_remote_datasource_impl.dart
import 'package:movie_discovery/features/actor/data/datasources/actor_remote_datasource.dart';
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';

import '../../domain/repositories/actor_repository.dart';

class ActorRepositoryImpl implements ActorRepository {
  final ActorRemoteDataSource remoteDataSource;

  ActorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ActorDetail> getActorDetail(int actorId) async {
    try {
      return await remoteDataSource.getActorDetail(actorId);
    } catch (e) {
      throw Exception('Repository xətası: $e');
    }
  }
}
