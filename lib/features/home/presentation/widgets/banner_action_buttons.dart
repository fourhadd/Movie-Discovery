// features/home/presentation/widgets/banner_action_buttons.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';

class BannerActionButtons extends StatelessWidget {
  const BannerActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.play_arrow),
          label: const Text("Play Trailer"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            backgroundColor: AppTheme.primaryRed,
          ),
        ),
        const SizedBox(width: 15),
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
