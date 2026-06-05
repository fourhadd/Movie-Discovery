// features/watchlist/presentation/pages/widgets/watchlist_grid_shimmer.dart
import 'package:flutter/material.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';

class WatchlistGridShimmer extends StatelessWidget {
  const WatchlistGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return const AppShimmer(borderRadius: 8);
      },
    );
  }
}
