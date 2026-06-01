// features/actor/data/datasources/actor_remote_datasource.dart
import 'package:dio/dio.dart';
import 'package:movie_discovery/features/actor/data/models/actor_model.dart';
import '../../../../core/constants/app_constants.dart';

abstract class ActorRemoteDataSource {
  Future<ActorDetailModel> getActorDetail(int actorId);
}

class ActorRemoteDataSourceImpl implements ActorRemoteDataSource {
  final Dio dio;

  ActorRemoteDataSourceImpl({required this.dio});

  @override
  Future<ActorDetailModel> getActorDetail(int actorId) async {
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}/person/$actorId',
        queryParameters: {
          'api_key': AppConstants.apiKey,
          'append_to_response': 'movie_credits,images',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return ActorDetailModel.fromJson(response.data);
      } else {
        throw Exception('Aktyor məlumatları tapılmadı.');
      }
    } on DioException catch (e) {
      throw Exception(
        'TMDB API Xətası (Dio): ${e.message ?? 'Bilinməyən xəta'}',
      );
    } catch (e) {
      throw Exception('Gözlənilməz xəta baş verdi: $e');
    }
  }
}
