// features/search/presentation/widgets/search_grid_shimmer.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';

class SearchGridShimmer extends StatelessWidget {
  const SearchGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final isCircleShimmer = index == 1 || index == 4;

        if (isCircleShimmer) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: AppShimmer(shape: BoxShape.circle)),
              const SizedBox(height: 8),

              AppShimmer(
                width: MediaQuery.of(context).size.width * 0.25,
                height: 14,
                borderRadius: 4,
              ),
              const SizedBox(height: 4),

              AppShimmer(
                width: MediaQuery.of(context).size.width * 0.12,
                height: 12,
                borderRadius: 4,
              ),
            ],
          );
        }

        return const AppShimmer(borderRadius: 12);
      },
    );
  }
}
