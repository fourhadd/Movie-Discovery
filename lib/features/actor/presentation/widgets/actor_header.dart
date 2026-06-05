// features/actor/presentation/widgets/actor_header.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/features/actor/domain/entities/actor_entity.dart';
import 'package:movie_discovery/features/actor/presentation/widgets/follow_button.dart';
import 'package:movie_discovery/features/profile/domain/entities/followed_actor.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_shimmer.dart';

class ActorHeader extends StatelessWidget {
  final ActorDetail actor;

  const ActorHeader({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 360,
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
                const SizedBox(width: 40),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -5,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: actor.profilePath.isNotEmpty
                    ? Image.network(
                        '${AppConstants.originalImageBaseUrl}${actor.profilePath}',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const AppShimmer(
                            width: 110,
                            height: 110,
                            shape: BoxShape.circle,
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 110,
                          height: 110,
                          color: AppTheme.cardDark,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white54,
                            size: 50,
                          ),
                        ),
                      )
                    : Container(
                        width: 110,
                        height: 110,
                        color: AppTheme.cardDark,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white54,
                          size: 50,
                        ),
                      ),
              ),
              const SizedBox(height: 15),
              Text(
                actor.name,
                textAlign: TextAlign.center,
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
              FollowButton(
                actor: FollowedActor(
                  id: actor.id,
                  name: actor.name,
                  profilePath:
                      '${AppConstants.originalImageBaseUrl}${actor.profilePath}',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
