// features/actor/presentation/widgets/follow_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/di/injection.dart';
import 'package:movie_discovery/features/profile/presentation/cubit/follow_cubit.dart';
import '../../../profile/domain/entities/followed_actor.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';

class FollowButton extends StatelessWidget {
  final FollowedActor actor;

  const FollowButton({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FollowCubit>()..checkFollowStatus(actor.id),
      child: BlocBuilder<FollowCubit, bool>(
        builder: (context, isFollowing) {
          return ElevatedButton.icon(
            onPressed: () {
              context.read<FollowCubit>().toggleFollow(actor);
              context.read<ProfileCubit>().loadUserProfile();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isFollowing
                  ? Colors.white24
                  : AppTheme.primaryRed,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
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
        },
      ),
    );
  }
}
