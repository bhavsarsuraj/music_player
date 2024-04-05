import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/modules/song_details_page/controllers/song_details_page_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/utils/helpers/song_helper.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
            Obx(
              () => IconButton(
                onPressed: isFavourite ? removeFavourite : markAsFavourite,
                icon: Icon(
                  isFavourite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: isFavourite ? Colors.red : null,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void removeFavourite() {
    SongHelper.removeFromFavourite(song.id!);
  }

  void markAsFavourite() {
    SongHelper.markFavourite(song.id!);
  }

  bool get isFavourite {
    return SongHelper.isFavourite(song.id!);
  }
}
