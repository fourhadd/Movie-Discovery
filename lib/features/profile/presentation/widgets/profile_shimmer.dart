// features/profile/presentation/widgets/profile_shimmer.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Center(
          child: AppShimmer(width: 130, height: 130, shape: BoxShape.circle),
        ),
        const SizedBox(height: 20),
        const AppShimmer(width: 160, height: 24, borderRadius: 6),
        const SizedBox(height: 10),
        const AppShimmer(width: 110, height: 14, borderRadius: 4),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppShimmer(width: 150, height: 18, borderRadius: 4),
              AppShimmer(width: 50, height: 18, borderRadius: 4),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(right: 18),
              child: AppShimmer(width: 84, height: 120, borderRadius: 10),
            ),
          ),
        ),
      ],
    );
  }
}
