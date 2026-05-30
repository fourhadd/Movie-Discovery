// features/media_detail/domain/usecases/get_movie_details.dart
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_detail.dart';
import '../repositories/media_detail_repository.dart';

class GetMovieDetails implements UseCase<MovieDetail, int> {
  final MediaDetailRepository repository;

  GetMovieDetails(this.repository);

  @override
  Future<MovieDetail> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
