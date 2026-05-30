// features/media_detail/domain/usecases/get_movie_trailer.dart
import '../../../../core/usecases/usecase.dart';
import '../repositories/media_detail_repository.dart';

class GetMovieTrailer implements UseCase<String, int> {
  final MediaDetailRepository repository;

  GetMovieTrailer(this.repository);

  @override
  Future<String> call(int movieId) async {
    return await repository.getMovieTrailer(movieId);
  }
}
