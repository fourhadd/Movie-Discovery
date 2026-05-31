// features/search/data/datasources/search_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/features/home/data/models/movie_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/search/movie',
      queryParameters: {
        'api_key': AppConstants.apiKey,
        'query': query,
        'include_adult': 'false',
      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Məlumatlar çəkilərkən xəta baş verdi');
    }
  }
}
