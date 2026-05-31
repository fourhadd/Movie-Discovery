// features/search/presentation/cubit/search_cubit.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/features/search/domain/usecases/search_movies.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovies searchMoviesUseCase;
  Timer? _debounce;

  SearchCubit({required this.searchMoviesUseCase}) : super(SearchInitial());

  void searchMovies(String query) {
    if (query.trim().isEmpty) {
      _debounce?.cancel();
      emit(SearchInitial());
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());
      try {
        final results = await searchMoviesUseCase(query);
        emit(SearchLoaded(results));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
