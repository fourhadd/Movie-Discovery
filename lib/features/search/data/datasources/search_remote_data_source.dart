// features/search/data/datasources/search_remote_data_source.dart
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/search_result_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchResultModel>> searchMulti(String query);
  Future<List<Map<String, dynamic>>> getGenres();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<SearchResultModel>> searchMulti(String query) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/search/multi',
      queryParameters: {
        'api_key': AppConstants.apiKey,
        'query': query,
        'include_adult': 'false',
      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => SearchResultModel.fromJson(json)).toList();
    } else {
      throw Exception('Məlumatlar çəkilərkən xəta baş verdi');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getGenres() async {
    final response = await dio.get(
      '${AppConstants.baseUrl}/genre/movie/list',
      queryParameters: {'api_key': AppConstants.apiKey},
    );
    if (response.statusCode == 200) {
      final List genres = response.data['genres'];
      return genres
          .map((e) => {'id': e['id'], 'name': e['name'] as String})
          .toList();
    } else {
      throw Exception('Janrlar gətirilərkən xəta baş verdi');
    }
  }
}
