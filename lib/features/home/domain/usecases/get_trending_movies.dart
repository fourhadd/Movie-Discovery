// features/home/domain/usecases/get_trending_movies.dart
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTrendingMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repository.getTrendingMovies();
  }
}
