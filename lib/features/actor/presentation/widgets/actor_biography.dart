// features/actor/presentation/widgets/actor_biography.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ActorBiography extends StatefulWidget {
  final String biography;

  const ActorBiography({super.key, required this.biography});

  @override
  State<ActorBiography> createState() => _ActorBiographyState();
}

class _ActorBiographyState extends State<ActorBiography> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.biography.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Biography",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Text(
              widget.biography,
              maxLines: isExpanded ? null : 4,
              overflow: isExpanded ? TextOverflow.clip : TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                isExpanded ? "Read less" : "Read more",
                style: const TextStyle(
                  color: AppTheme.primaryRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
