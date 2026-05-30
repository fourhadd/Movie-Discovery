// features/media_detail/domain/usecases/get_movie_cast.dart
import '../../../../core/usecases/usecase.dart';
import '../entities/cast.dart';
import '../repositories/media_detail_repository.dart';

class GetMovieCast implements UseCase<List<Cast>, int> {
  final MediaDetailRepository repository;

  GetMovieCast(this.repository);

  @override
  Future<List<Cast>> call(int movieId) async {
    return await repository.getMovieCast(movieId);
  }
}
