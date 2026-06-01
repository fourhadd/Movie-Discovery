// features/actor/presentation/widgets/actor_stats.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ActorStats extends StatelessWidget {
  final int movieCount;

  const ActorStats({super.key, required this.movieCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem(
              Icons.movie_creation_outlined,
              "$movieCount",
              "Movies",
              AppTheme.primaryRed,
            ),
            _buildStatItem(
              Icons.emoji_events_outlined,
              "12",
              "Awards",
              Colors.amber,
            ),
            _buildStatItem(
              Icons.star_border_rounded,
              "9.8",
              "Rating",
              AppTheme.primaryRed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String value,
    String label,
    Color iconColor,
  ) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
