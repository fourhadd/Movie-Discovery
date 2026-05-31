// features/home/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_discovery/features/home/presentation/cubit/home_state.dart';
import 'package:movie_discovery/features/home/presentation/widgets/home_hero_banner.dart';
import 'package:movie_discovery/features/home/presentation/widgets/home_movie_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    if (homeCubit.state is! HomeLoaded && homeCubit.state is! HomeLoading) {
      homeCubit.fetchHomeData();
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryRed),
            );
          }

          if (state is HomeLoaded) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeroBanner(featuredMovie: state.trendingMovies.first),

                  const SizedBox(height: 20),

                  HomeMovieSection(
                    title: "Trending Now",
                    movies: state.trendingMovies,
                  ),

                  const SizedBox(height: 20),
                  HomeMovieSection(
                    title: "Popular Movies",
                    movies: state.popularMovies,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
