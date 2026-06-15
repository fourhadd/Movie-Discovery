// features/search/presentation/cubit/search_cubit.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/errors/failures.dart';
import 'package:movie_discovery/core/usecases/usecase.dart';
import 'package:movie_discovery/features/search/domain/usecases/search_movies.dart';
import 'package:movie_discovery/features/search/domain/usecases/get_genres.dart';
import '../cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovies searchMoviesUseCase;
  final GetGenres getGenresUseCase;
  Timer? _debounce;

  List<Map<String, dynamic>> _loadedCategories = [];
  final Map<int, dynamic> _categoryCache = {};

  SearchCubit({
    required this.searchMoviesUseCase,
    required this.getGenresUseCase,
  }) : super(SearchInitial(topResults: [], categories: [])) {
    initSearchPage();
  }

  void initSearchPage() async {
    emit(SearchLoading());
    try {
      _loadedCategories = await getGenresUseCase(NoParams());

      if (_loadedCategories.isNotEmpty) {
        final firstCategory = _loadedCategories.first;
        changeCategory(firstCategory);
      } else {
        emit(SearchInitial(topResults: [], categories: []));
      }
    } catch (e) {
      if (e is Failure) {
        emit(SearchError(e.message));
      } else {
        emit(SearchError("Kateqoriyalar yüklənərkən xəta baş verdi."));
      }
    }
  }

  void changeCategory(Map<String, dynamic> category) async {
    _debounce?.cancel();
    final int categoryId = category['id'];
    final String categoryName = category['name'];

    if (_categoryCache.containsKey(categoryId)) {
      emit(
        SearchInitial(
          topResults: _categoryCache[categoryId],
          categories: _loadedCategories,
          selectedCategory: category,
        ),
      );
      return;
    }

    emit(
      SearchInitial(
        topResults: [],
        categories: _loadedCategories,
        selectedCategory: category,
      ),
    );

    try {
      final results = await searchMoviesUseCase(categoryName);
      _categoryCache[categoryId] = results;

      emit(
        SearchInitial(
          topResults: results,
          categories: _loadedCategories,
          selectedCategory: category,
        ),
      );
    } catch (e) {
      if (e is Failure) {
        emit(SearchError(e.message));
      } else {
        emit(SearchError("Filmlər yüklənərkən xəta baş verdi."));
      }
    }
  }

  void searchMovies(String query) {
    if (query.trim().isEmpty) {
      _debounce?.cancel();
      final currentState = state;
      if (currentState is SearchInitial) {
        emit(
          SearchInitial(
            topResults:
                _categoryCache[currentState.selectedCategory?['id']] ?? [],
            categories: _loadedCategories,
            selectedCategory: currentState.selectedCategory,
          ),
        );
      } else {
        if (_loadedCategories.isNotEmpty) {
          changeCategory(_loadedCategories.first);
        }
      }
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());
      try {
        final results = await searchMoviesUseCase(query);
        emit(SearchLoaded(results));
      } catch (e) {
        if (e is Failure) {
          emit(SearchError(e.message));
        } else {
          emit(SearchError("Axtarış zamanı xəta baş verdi."));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
