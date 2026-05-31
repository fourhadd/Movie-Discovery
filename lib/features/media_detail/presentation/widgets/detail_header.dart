// features/media_detail/presentation/widgets/detail_header.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/features/media_detail/domain/entities/movie_detail.dart';
import 'package:movie_discovery/features/media_detail/presentation/widgets/trailer_video_player.dart';

class DetailHeader extends StatelessWidget {
  final MovieDetail movie;
  final String trailerKey;
  const DetailHeader({
    super.key,
    required this.movie,
    required this.trailerKey,
  });

  void _playTrailer(BuildContext context) {
    if (trailerKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bu film üçün trailer tapılmadı!')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: TrailerVideoPlayer(videoKey: trailerKey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                '${AppConstants.originalImageBaseUrl}${movie.backdropPath}',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 400,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, AppTheme.backgroundDark],
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 5),
                  Text(
                    movie.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '${movie.runtime} min',
                    style: const TextStyle(color: AppTheme.textGrey),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    movie.releaseDate.split('-')[0],
                    style: const TextStyle(color: AppTheme.textGrey),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  backgroundColor: AppTheme.primaryRed,
                ),
                onPressed: () => _playTrailer(context),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Watch Trailer'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
