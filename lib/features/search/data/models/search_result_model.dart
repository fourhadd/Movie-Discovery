// features/search/data/models/search_result_model.dart
class SearchResultModel {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String mediaType;

  SearchResultModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.mediaType,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    final mediaType = json['media_type'] ?? 'movie';

    if (mediaType == 'person') {
      return SearchResultModel(
        id: json['id'],
        title: json['name'] ?? '',
        posterPath: json['profile_path'] ?? '',
        voteAverage: 0.0,
        mediaType: mediaType,
      );
    }

    return SearchResultModel(
      id: json['id'],
      title: json['title'] ?? json['name'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      mediaType: mediaType,
    );
  }
}
