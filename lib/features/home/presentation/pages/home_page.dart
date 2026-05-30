// features/home/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_discovery/features/home/presentation/cubit/home_state.dart';
import 'package:movie_discovery/features/home/presentation/widgets/home_hero_banner.dart';
import 'package:movie_discovery/features/home/presentation/widgets/home_movie_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryRed),
            );
          }

          if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Böyük Banner Widget
                  HomeHeroBanner(featuredMovie: state.trendingMovies.first),

                  const SizedBox(height: 20),

                  // Trend Filmlər Siyahısı Widget
                  HomeMovieSection(
                    title: "Trending Now",
                    movies: state.trendingMovies,
                  ),

                  const SizedBox(height: 20),

                  // Populyar Filmlər Siyahısı Widget
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
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
