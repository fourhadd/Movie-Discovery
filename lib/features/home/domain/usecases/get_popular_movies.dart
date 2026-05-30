// features/home/domain/usecases/get_popular_movies.dart
import '../../../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repository.getPopularMovies();
  }
}
