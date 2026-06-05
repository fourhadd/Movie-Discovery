// features/media_detail/presentation/widgets/movie_detail_shimmer.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';

class MovieDetailShimmer extends StatelessWidget {
  const MovieDetailShimmer({super.key});

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
                height: 450,
                borderRadius: 0,
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppShimmer(width: 220, height: 32, borderRadius: 8),
                    const SizedBox(height: 12),
                    const AppShimmer(width: 140, height: 16, borderRadius: 4),
                    const SizedBox(height: 24),
                    const AppShimmer(
                      width: double.infinity,
                      height: 50,
                      borderRadius: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    AppShimmer(width: 80, height: 32, borderRadius: 16),
                    SizedBox(width: 12),
                    AppShimmer(width: 80, height: 32, borderRadius: 16),
                  ],
                ),

                const SizedBox(height: 30),

                const AppShimmer(width: 120, height: 24, borderRadius: 6),
                const SizedBox(height: 16),
                const AppShimmer(
                  width: double.infinity,
                  height: 14,
                  borderRadius: 4,
                ),
                const SizedBox(height: 8),
                const AppShimmer(
                  width: double.infinity,
                  height: 14,
                  borderRadius: 4,
                ),
                const SizedBox(height: 8),
                const AppShimmer(width: 250, height: 14, borderRadius: 4),

                const SizedBox(height: 30),

                const AppShimmer(width: 80, height: 24, borderRadius: 6),
                const SizedBox(height: 16),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Column(
                          children: [
                            AppShimmer(
                              width: 70,
                              height: 70,
                              shape: BoxShape.circle,
                            ),
                            SizedBox(height: 12),
                            AppShimmer(width: 50, height: 10, borderRadius: 4),
                            SizedBox(height: 4),
                            AppShimmer(width: 40, height: 10, borderRadius: 4),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                const AppShimmer(width: 150, height: 24, borderRadius: 6),
                const SizedBox(height: 16),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: AppShimmer(
                          width: 120,
                          height: 180,
                          borderRadius: 12,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
