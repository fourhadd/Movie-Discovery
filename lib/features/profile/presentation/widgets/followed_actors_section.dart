// features/profile/presentation/widgets/followed_actors_section.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/followed_actor.dart';

class FollowedActorsSection extends StatelessWidget {
  final List<FollowedActor> actors;

  const FollowedActorsSection({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    if (actors.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Center(
          child: Text(
            "Hələ ki heç bir aktyoru təqib etmirsiniz.",
            style: TextStyle(color: Colors.white38, fontSize: 14),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            "Takip etdiyim aktyorlar",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: actors.length,
            itemBuilder: (context, index) {
              final actor = actors[index];

              return InkWell(
                onTap: () {
                  context.push('/actor-details/${actor.id}');
                },
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    top: 4,
                    bottom: 4,
                    left: 4,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white12,
                        backgroundImage: NetworkImage(actor.profilePath),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 84,
                        child: Text(
                          actor.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
