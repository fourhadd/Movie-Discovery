// features/search/domain/usecases/get_genres.dart
import 'package:movie_discovery/core/usecases/usecase.dart';
import '../repositories/search_repository.dart';

class GetGenres implements UseCase<List<Map<String, dynamic>>, NoParams> {
  final SearchRepository repository;

  GetGenres(this.repository);

  @override
  Future<List<Map<String, dynamic>>> call(NoParams params) async {
    return await repository.getGenres();
  }
}
