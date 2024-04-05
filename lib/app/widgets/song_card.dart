import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/modules/song_details_page/controllers/song_details_page_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({super.key, required this.song});

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
        padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                song.previewImage ?? '',
                height: 54,
                width: 54,
                fit: BoxFit.cover,
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: null,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
