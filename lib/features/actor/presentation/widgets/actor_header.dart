// features/actor/presentation/widgets/actor_header.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

class ActorHeader extends StatelessWidget {
  final ActorDetail actor;

  const ActorHeader({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 320,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.7),
                AppTheme.backgroundDark,
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "FILMOGRAPHY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white12,
                backgroundImage: NetworkImage(
                  '${AppConstants.originalImageBaseUrl}${actor.profilePath}',
                ),
              ),
              const SizedBox(height: 15),
              Text(
                actor.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                actor.profession,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 15),
              const _FollowButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class _FollowButton extends StatefulWidget {
  const _FollowButton();

  @override
  State<_FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<_FollowButton> {
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
