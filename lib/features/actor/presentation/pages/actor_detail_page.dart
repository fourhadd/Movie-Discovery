// features/actor/presentation/pages/actor_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_discovery/features/actor/presentation/cubit/actor_detail_cubit.dart';
import 'package:movie_discovery/features/actor/presentation/widgets/actor_detail_shimmer.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/actor_detail_state.dart';
import '../widgets/actor_biography.dart';
import '../widgets/actor_header.dart';
import '../widgets/actor_known_for.dart';
import '../widgets/actor_photos.dart';
import '../widgets/actor_stats.dart';

class ActorDetailPage extends StatelessWidget {
  final int actorId;

  const ActorDetailPage({super.key, required this.actorId});

  @override
  Widget build(BuildContext context) {
    final actorCubit = context.read<ActorDetailCubit>();
    if (actorCubit.state is! ActorDetailLoaded &&
        actorCubit.state is! ActorDetailLoading) {
      actorCubit.fetchActorDetail(actorId);
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundDark,
      body: BlocBuilder<ActorDetailCubit, ActorDetailState>(
        builder: (context, state) {
          if (state is ActorDetailLoading) {
            return const ActorDetailShimmer();
          }

          if (state is ActorDetailError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            );
          }

          if (state is ActorDetailLoaded) {
            final actor = state.actor;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActorHeader(actor: actor),
                  const SizedBox(height: 25),
                  ActorStats(movieCount: actor.movieCount),
                  const SizedBox(height: 25),
                  ActorBiography(biography: actor.biography),
                  const SizedBox(height: 25),
                  ActorKnownFor(movies: actor.knownFor),
                  const SizedBox(height: 5),
                  ActorPhotos(photos: actor.photos),
                  const SizedBox(height: 40),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
