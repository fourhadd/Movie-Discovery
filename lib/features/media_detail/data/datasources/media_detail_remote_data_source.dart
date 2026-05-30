// features/media_detail/data/datasources/media_detail_remote_data_source.dart
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../home/data/models/movie_model.dart';
import '../models/cast_model.dart';
import '../models/movie_detail_model.dart';

abstract class MediaDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetails(int movieId);
  Future<List<CastModel>> getMovieCast(int movieId);
  Future<List<MovieModel>> getSimilarMovies(int movieId);
  Future<String> getMovieTrailer(int movieId);
}

class MediaDetailRemoteDataSourceImpl implements MediaDetailRemoteDataSource {
  final Dio dio;

  MediaDetailRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieDetailModel> getMovieDetails(int movieId) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/movie/$movieId',
      queryParameters: {'api_key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw Exception('Film detalları tapılmadı');
    }
  }

  @override
  Future<List<CastModel>> getMovieCast(int movieId) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/movie/$movieId/credits',
      queryParameters: {'api_key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      final List castList = response.data['cast'];
      return castList.map((json) => CastModel.fromJson(json)).toList();
    } else {
      throw Exception('Aktyor məlumatları gətirilə bilmədi');
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/movie/$movieId/similar',
      queryParameters: {'api_key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Oxşar filmlər tapılmadı');
    }
  }

  @override
  Future<String> getMovieTrailer(int movieId) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/movie/$movieId/videos',
      queryParameters: {'api_key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];

      // YouTube-da rəsmi Trailer olan videonu tapırıq
      final trailerVideo = results.firstWhere(
        (video) => video['site'] == 'YouTube' && video['type'] == 'Trailer',
        orElse: () => results.firstWhere(
          (video) => video['site'] == 'YouTube',
          orElse: () => null,
        ),
      );

      if (trailerVideo != null) {
        return trailerVideo['key'];
      }
      throw Exception('Bu film üçün trailer tapılmadı');
    } else {
      throw Exception('Video sorğusunda xəta baş verdi');
    }
  }
}
