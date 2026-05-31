// features/actor/data/datasources/actor_remote_datasource_impl.dart
import 'package:movie_discovery/features/actor/data/datasources/actor_remote_datasource.dart';

import '../../domain/entities/actor_entity.dart';
import '../../domain/repositories/actor_repository.dart';

class ActorRepositoryImpl implements ActorRepository {
  final ActorRemoteDataSource remoteDataSource;

  ActorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ActorEntity>> getMovieCast(int movieId) async {
    return await remoteDataSource.getMovieCast(movieId);
  }

  @override
  Future<ActorEntity> getActorDetails(int actorId) {
    throw UnimplementedError();
  }
}
