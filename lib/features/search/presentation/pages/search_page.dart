// features/search/presentation/pages/search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/features/search/presentation/widgets/category_list.dart';
import 'package:movie_discovery/features/search/presentation/widgets/movie_grid.dart';
import 'package:movie_discovery/features/search/presentation/widgets/search_header.dart';
import 'package:movie_discovery/features/search/presentation/widgets/search_grid_shimmer.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              SearchHeader(
                controller: _searchController,
                onChanged: (value) =>
                    context.read<SearchCubit>().searchMovies(value),
                onClear: () {
                  _searchController.clear();
                  context.read<SearchCubit>().searchMovies('');
                },
              ),
              const SizedBox(height: 15),

              BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (previous, current) {
                  return current is SearchInitial;
                },
                builder: (context, state) {
                  if (state is SearchInitial && state.categories.isNotEmpty) {
                    return CategoryList(
                      categories: state.categories,
                      selectedCategory: state.selectedCategory,
                      onCategorySelected: (cat) {
                        context.read<SearchCubit>().changeCategory(cat);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (previous, current) =>
                    current is SearchInitial || current is SearchLoaded,
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        'Top Results',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const SearchGridShimmer();
                    }
                    if (state is SearchError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    if (state is SearchInitial) {
                      if (state.topResults.isEmpty) {
                        return const SearchGridShimmer();
                      }
                      return MovieGrid(movies: state.topResults);
                    }
                    if (state is SearchLoaded) {
                      if (state.movies.isEmpty) {
                        return const Center(
                          child: Text(
                            'Heç bir nəticə tapılmadı 😕',
                            style: TextStyle(color: AppTheme.textGrey),
                          ),
                        );
                      }
                      return MovieGrid(movies: state.movies);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
