// di/injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../features/home/data/datasources/home_remote_data_source.dart';
import '../features/home/data/repositories/movie_repository_impl.dart';
import '../features/home/domain/repositories/movie_repository.dart';
import '../features/home/domain/usecases/get_popular_movies.dart';
import '../features/home/domain/usecases/get_trending_movies.dart';
import '../features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());

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
}
