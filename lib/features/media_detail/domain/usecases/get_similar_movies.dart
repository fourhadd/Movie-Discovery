// features/media_detail/domain/usecases/get_similar_movies.dart
import '../../../../core/usecases/usecase.dart';
import '../../../home/domain/entities/movie.dart';
import '../repositories/media_detail_repository.dart';

class GetSimilarMovies implements UseCase<List<Movie>, int> {
  final MediaDetailRepository repository;

  GetSimilarMovies(this.repository);

  @override
  Future<List<Movie>> call(int movieId) async {
    return await repository.getSimilarMovies(movieId);
  }
}
