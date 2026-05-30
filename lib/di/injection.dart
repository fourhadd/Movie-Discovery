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
import '../features/home/data/datasources/home_remote_data_source.dart';
import '../features/home/data/repositories/movie_repository_impl.dart';
import '../features/home/domain/repositories/movie_repository.dart';
import '../features/home/domain/usecases/get_popular_movies.dart';
import '../features/home/domain/usecases/get_trending_movies.dart';
import '../features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
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
}
