// features/actor/data/datasources/actor_remote_datasource.dart
import 'package:dio/dio.dart';
import '../models/actor_model.dart';

abstract class ActorRemoteDataSource {
  Future<List<ActorModel>> getMovieCast(int movieId);
}

class ActorRemoteDataSourceImpl implements ActorRemoteDataSource {
  final Dio dio;

  ActorRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ActorModel>> getMovieCast(int movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    if (response.statusCode == 200) {
      final List<dynamic> castJson = response.data['cast'];
      return castJson.map((json) => ActorModel.fromJson(json)).toList();
    } else {
      throw Exception('Aktyor siyahısı yüklənərkən xəta baş verdi');
    }
  }
}
