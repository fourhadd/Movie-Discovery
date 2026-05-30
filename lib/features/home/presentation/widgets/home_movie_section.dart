// features/home/presentation/widgets/home_movie_section.dart

import 'package:flutter/material.dart';
import 'package:movie_discovery/features/home/domain/entities/movie.dart';
import 'package:movie_discovery/features/home/presentation/widgets/movie_card.dart';

class HomeMovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const HomeMovieSection({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}
