// di/injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_discovery/features/media_detail/data/datasources/media_detail_remote_data_source.dart';
import 'package:movie_discovery/features/media_detail/data/repositories/media_detail_repository_impl.dart';
import 'package:movie_discovery/features/media_detail/domain/repositories/media_detail_repository.dart';
import 'package:movie_discovery/features/media_detail/domain/usecases/get_movie_cast.dart';
import 'package:movie_discovery/features/media_detail/domain/usecases/get_movie_details.dart';
import 'package:movie_discovery/features/media_detail/domain/usecases/get_movie_trailer.dart';
import 'package:movie_discovery/features/media_detail/domain/usecases/get_similar_movies.dart';
import 'package:movie_discovery/features/media_detail/presentation/cubit/media_detail_cubit.dart';
import 'package:movie_discovery/features/search/data/datasources/search_remote_data_source.dart';
import 'package:movie_discovery/features/search/data/repositories/search_repository_impl.dart';
import 'package:movie_discovery/features/search/domain/repositories/search_repository.dart';
import 'package:movie_discovery/features/search/domain/usecases/search_movies.dart';
import 'package:movie_discovery/features/search/presentation/cubit/search_cubit.dart';
import 'package:movie_discovery/features/watchlist/data/datasources/watchlist_local_data_source.dart';
import 'package:movie_discovery/features/watchlist/data/repositories/watchlist_repository_impl.dart';
import 'package:movie_discovery/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:movie_discovery/features/watchlist/domain/usecases/watchlist_usecases.dart';
import 'package:movie_discovery/features/watchlist/presentation/cubit/watchlist_cubit.dart';
import '../features/home/data/datasources/home_remote_data_source.dart';
import '../features/home/data/repositories/movie_repository_impl.dart';
import '../features/home/domain/repositories/movie_repository.dart';
import '../features/home/domain/usecases/get_popular_movies.dart';
import '../features/home/domain/usecases/get_trending_movies.dart';
import '../features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await sl.reset();

  sl.registerLazySingleton(() => Dio());

  // --- Home Feature ---

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => GetTrendingMovies(sl()));
  sl.registerLazySingleton(() => GetPopularMovies(sl()));

  sl.registerFactory(
    () => HomeCubit(getTrendingMovies: sl(), getPopularMovies: sl()),
  );

  // --- Media Detail Feature ---
  sl.registerLazySingleton<MediaDetailRemoteDataSource>(
    () => MediaDetailRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<MediaDetailRepository>(
    () => MediaDetailRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => GetMovieDetails(sl()));
  sl.registerLazySingleton(() => GetMovieCast(sl()));
  sl.registerLazySingleton(() => GetSimilarMovies(sl()));
  sl.registerLazySingleton(() => GetMovieTrailer(sl()));

  sl.registerFactory(
    () => MediaDetailCubit(
      getMovieDetails: sl(),
      getMovieCast: sl(),
      getSimilarMovies: sl(),
      getMovieTrailer: sl(),
    ),
  );

  // ---Search Feature ---

  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => SearchMovies(sl()));
  sl.registerFactory(() => SearchCubit(searchMoviesUseCase: sl()));

  // ---Watchlist Feature ---

  sl.registerLazySingleton<WatchlistLocalDataSource>(
    () => WatchlistLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton(() => ToggleWatchlist(sl()));
  sl.registerLazySingleton(() => GetWatchlistMovies(sl()));
  sl.registerLazySingleton(() => CheckWatchlistStatus(sl()));
  sl.registerFactory(
    () => WatchlistCubit(
      getWatchlistMovies: sl(),
      toggleWatchlist: sl(),
      checkWatchlistStatus: sl(),
    ),
  );
}
