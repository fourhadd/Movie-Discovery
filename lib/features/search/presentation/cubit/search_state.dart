// features/search/presentation/cubit/search_state.dart
import '../../data/models/search_result_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {
  final List<SearchResultModel> topResults;
  final List<Map<String, dynamic>> categories;
  final Map<String, dynamic>? selectedCategory;

  SearchInitial({
    required this.topResults,
    required this.categories,
    this.selectedCategory,
  });
}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<SearchResultModel> movies;
  SearchLoaded(this.movies);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
