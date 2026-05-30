// features/media_detail/presentation/widgets/detail_cast_list.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_discovery/core/constants/app_constants.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';
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
            itemCount: castList.length > 12
                ? 12
                : castList.length, // İlk 12 aktyor
            itemBuilder: (context, index) {
              final actor = castList[index];
              return Container(
                margin: const EdgeInsets.only(right: 16),
                width: 80,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: AppTheme.cardDark,
                      backgroundImage: actor.profilePath.isNotEmpty
                          ? NetworkImage(
                              '${AppConstants.imageBaseUrl}${actor.profilePath}',
                            )
                          : null,
                      child: actor.profilePath.isEmpty
                          ? const Icon(Icons.person, color: Colors.white54)
                          : null,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
