// features/search/presentation/pages/search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
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
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundDark,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Filmləri axtarın...',
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: const Icon(Icons.search, color: AppTheme.primaryRed),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear, color: Colors.white54),
              onPressed: () {
                _searchController.clear();
                context.read<SearchCubit>().searchMovies('');
              },
            ),
          ),
          onChanged: (value) => context.read<SearchCubit>().searchMovies(value),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    size: 80,
                    color: Colors.white24,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Axtarmaq istədiyiniz filmin adını yazın',
                    style: TextStyle(color: AppTheme.textGrey),
                  ),
                ],
              ),
            );
          }
          if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryRed),
            );
          }
          if (state is SearchError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is SearchLoaded) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text(
                  'Heç bir film tapılmadı 😕',
                  style: TextStyle(color: AppTheme.textGrey),
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                  onTap: () => context.push('/movie-details/${movie.id}'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.cardDark,
                      image: movie.posterPath.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(
                                '${AppConstants.imageBaseUrl}${movie.posterPath}',
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: movie.posterPath.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
