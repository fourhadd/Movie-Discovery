// features/actor/presentation/widgets/follow_button.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';

class FollowButton extends StatefulWidget {
  const FollowButton();

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => setState(() => isFollowing = !isFollowing),
      style: ElevatedButton.styleFrom(
        backgroundColor: isFollowing ? Colors.white24 : AppTheme.primaryRed,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      icon: Icon(
        isFollowing ? Icons.check : Icons.person_add,
        color: Colors.white,
        size: 18,
      ),
      label: Text(
        isFollowing ? "Following" : "Follow",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
