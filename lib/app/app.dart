// app/app.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/navigation/app_router.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/di/injection.dart' as di;
import 'package:movie_discovery/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_discovery/features/media_detail/presentation/cubit/media_detail_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => di.sl<HomeCubit>()),
        BlocProvider<MediaDetailCubit>(
          create: (context) => di.sl<MediaDetailCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Movie Discovery App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
