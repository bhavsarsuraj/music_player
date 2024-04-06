import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/modules/song_details_page/controllers/song_details_page_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/widgets/favourite_animated_widget.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final bool isFavourite;
  final VoidCallback onPressedFavourite;
  const SongCard({
    super.key,
    required this.song,
    required this.isFavourite,
    required this.onPressedFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Get.toNamed(
          Routes.SONG_DETAILS_PAGE,
          arguments: SongDetailsPageArguments(song: song),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: song,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: song.previewImage ?? '',
                  height: 54,
                  width: 54,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    song.artistNames,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).hintColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            FavouriteAnimationWidget(
              isFavourite: isFavourite,
              onPressed: onPressedFavourite,
            ),
          ],
        ),
      ),
    );
  }
}
