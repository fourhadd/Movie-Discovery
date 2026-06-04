// features/home/presentation/cubit/home_cubit.dart
import 'package:bloc/bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_trending_movies.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTrendingMovies getTrendingMovies;
  final GetPopularMovies getPopularMovies;

  HomeCubit({required this.getTrendingMovies, required this.getPopularMovies})
    : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    try {
      final results = await Future.wait([
        getTrendingMovies(NoParams()),
        getPopularMovies(NoParams()),
      ]);

      emit(HomeLoaded(trendingMovies: results[0], popularMovies: results[1]));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void markImagesAsLoaded() {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(isImagesLoaded: true));
    }
  }
}
