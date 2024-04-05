import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/app/services/audio_player_service.dart';
import 'package:music_player/app/utils/extensions/integer_extension.dart';
import '../controllers/song_details_page_controller.dart';

class SongDetailsPageView extends GetView<SongDetailsPageController> {
  const SongDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const _SongImage(),
            const SizedBox(height: 20),
            const _ProgressBar(),
            const SizedBox(height: 12),
            const _PlayPauseButton(),
          ],
        ),
      ),
    );
  }
}

class _SongImage extends GetView<SongDetailsPageController> {
  const _SongImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Hero(
        tag: controller.arguments!.song,
        placeholderBuilder: (context, heroSize, child) {
          return AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              width: Get.width,
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: CachedNetworkImage(
              imageUrl: controller.arguments!.song.previewImage ?? '',
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayPauseButton extends GetView<SongDetailsPageController> {
  const _PlayPauseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final processingState = AudioPlayerService.audioProcessingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        return Container(
          margin: EdgeInsets.all(8.0),
          width: 64.0,
          height: 64.0,
          child: CircularProgressIndicator(),
        );
      } else if (!AudioPlayerService.isPlaying) {
        return IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 64.0,
          onPressed: AudioPlayerService.play,
        );
      } else if (processingState != ProcessingState.completed) {
        return IconButton(
          icon: Icon(Icons.pause),
          iconSize: 64.0,
          onPressed: AudioPlayerService.pause,
        );
      } else {
        return IconButton(
          icon: Icon(Icons.replay),
          iconSize: 64.0,
          onPressed: AudioPlayerService.replay,
        );
      }
    });
  }
}

class _ProgressBar extends GetView<SongDetailsPageController> {
  const _ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Slider(
            value: AudioPlayerService.songProgress,
            onChanged: AudioPlayerService.onChangeProgress,
            onChangeEnd: (_) => AudioPlayerService.seek(),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AudioPlayerService.currentDuration.formatSeconds,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  AudioPlayerService.totalDuration.formatSeconds,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
