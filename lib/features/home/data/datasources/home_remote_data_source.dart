// features/home/data/datasources/home_remote_data_source.dart
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  HomeRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/trending/movie/day',
      queryParameters: {'api_key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Server xətası baş verdi');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/movie/popular',
      queryParameters: {'api_key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Server xətası baş verdi');
    }
  }
}
