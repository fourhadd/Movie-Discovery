// features/actor/presentation/widgets/actor_detail_shimmer.dart
import 'package:flutter/material.dart';
import '../../../../core/widgets/app_shimmer.dart';

class ActorDetailShimmer extends StatelessWidget {
  const ActorDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const AppShimmer(
                width: double.infinity,
                height: 320,
                borderRadius: 0,
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const AppShimmer(width: 90, height: 120, borderRadius: 12),
                    const SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        AppShimmer(width: 180, height: 26, borderRadius: 6),
                        SizedBox(height: 10),
                        AppShimmer(width: 120, height: 14, borderRadius: 4),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AppShimmer(width: 90, height: 55, borderRadius: 10),
                AppShimmer(width: 90, height: 55, borderRadius: 10),
                AppShimmer(width: 90, height: 55, borderRadius: 10),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppShimmer(width: 120, height: 22, borderRadius: 4),
                const SizedBox(height: 16),
                AppShimmer(width: double.infinity, height: 14, borderRadius: 4),
                const SizedBox(height: 8),
                AppShimmer(width: double.infinity, height: 14, borderRadius: 4),
                const SizedBox(height: 8),
                AppShimmer(width: 220, height: 14, borderRadius: 4),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppShimmer(
                  width: 140,
                  height: 22,
                  borderRadius: 4,
                ), // Başlıq
                const SizedBox(height: 16),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: AppShimmer(
                        width: 100,
                        height: 160,
                        borderRadius: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppShimmer(width: 110, height: 22, borderRadius: 4),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: AppShimmer(
                        width: 150,
                        height: 100,
                        borderRadius: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
