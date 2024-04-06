import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/app/modules/song_details_page/controllers/song_details_page_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/services/audio_player_service.dart';

class CurrentPlayingSong extends StatelessWidget {
  const CurrentPlayingSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (AudioPlayerService.song == null) {
          return Container();
        } else {
          return GestureDetector(
            onTap: didTapDetails,
            child: Container(
              height: 64,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF2F2F2F)
                  : Color(0xFFFDFDFC),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _SongProgress(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 8,
                      bottom: 8,
                      right: 10,
                    ),
                    child: const Row(
                      children: [
                        _Image(),
                        SizedBox(width: 12),
                        _NameAndArtists(),
                        SizedBox(width: 12),
                        _PlayPauseButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void didTapDetails() {
    Get.toNamed(
      Routes.SONG_DETAILS_PAGE,
      arguments: SongDetailsPageArguments(
        song: AudioPlayerService.song!,
      ),
    );
  }
}

class _SongProgress extends StatelessWidget {
  const _SongProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LinearProgressIndicator(
        value: AudioPlayerService.songProgress,
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Hero(
        tag: AudioPlayerService.song!.id!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: AudioPlayerService.song?.previewImage ?? '',
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _NameAndArtists extends StatelessWidget {
  const _NameAndArtists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AudioPlayerService.song?.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              AudioPlayerService.song?.artistNames ?? '',
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
    );
  }
}

class _PlayPauseButton extends StatelessWidget {
  const _PlayPauseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return SizedBox(
      height: 44,
      child: Obx(() {
        final processingState = AudioPlayerService.audioProcessingState;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 28,
            height: 28,
            child: CircularProgressIndicator(color: iconColor),
          );
        } else if (!AudioPlayerService.isPlaying) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 28,
            onPressed: AudioPlayerService.play,
            color: iconColor,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 28,
            onPressed: AudioPlayerService.pause,
            color: iconColor,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 28,
            onPressed: AudioPlayerService.replay,
            color: iconColor,
          );
        }
      }),
    );
  }
}
