// features/media_detail/presentation/widgets/detail_cast_list.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
import 'package:movie_discovery/core/widgets/app_shimmer.dart';
import 'package:movie_discovery/features/media_detail/domain/entities/cast.dart';

class DetailCastList extends StatelessWidget {
  final List<Cast> castList;
  const DetailCastList({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    if (castList.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Cast',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            itemCount: castList.length > 12 ? 12 : castList.length,
            itemBuilder: (context, index) {
              final actor = castList[index];
              return InkWell(
                onTap: () {
                  context.push('/actor-details/${actor.id}');
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 80,
                  child: Column(
                    children: [
                      ClipOval(
                        child: actor.profilePath.isNotEmpty
                            ? Image.network(
                                '${AppConstants.imageBaseUrl}${actor.profilePath}',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const AppShimmer(
                                        width: 70,
                                        height: 70,
                                        shape: BoxShape.circle,
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      width: 70,
                                      height: 70,
                                      color: AppTheme.cardDark,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white54,
                                      ),
                                    ),
                              )
                            : Container(
                                width: 70,
                                height: 70,
                                color: AppTheme.cardDark,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white54,
                                ),
                              ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        actor.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
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
