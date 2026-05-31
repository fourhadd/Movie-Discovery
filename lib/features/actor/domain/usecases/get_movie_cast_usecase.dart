// features/actor/domain/usecases/get_movie_cast_usecase.dart
import '../entities/actor_entity.dart';
import '../repositories/actor_repository.dart';

class GetMovieCast {
  final ActorRepository repository;

  GetMovieCast(this.repository);

  Future<List<ActorEntity>> call(int movieId) async {
    return await repository.getMovieCast(movieId);
  }
}
