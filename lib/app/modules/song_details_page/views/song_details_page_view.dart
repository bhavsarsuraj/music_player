import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/app/services/audio_player_service.dart';
import 'package:music_player/app/utils/constants/images.dart';
import 'package:music_player/app/utils/extensions/integer_extension.dart';
import 'package:music_player/app/widgets/favourite_animated_widget.dart';
import '../controllers/song_details_page_controller.dart';

class SongDetailsPageView extends GetView<SongDetailsPageController> {
  const SongDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => FavouriteAnimationWidget(
              isFavourite: controller.isFavourite,
              onPressed: controller.onPressedFavourite,
            ),
          )
        ],
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _SongImage(),
            SizedBox(height: 20),
            Spacer(),
            _NameAndArtists(),
            SizedBox(height: 20),
            _ProgressBar(),
            SizedBox(height: 12),
            _Buttons(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _NameAndArtists extends GetView<SongDetailsPageController> {
  const _NameAndArtists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.currentSong?.title ?? '',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.left,
            ),
            Text(
              controller.currentSong?.artistNames ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color
                        ?.withOpacity(0.8),
                  ),
              maxLines: 1,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ShuffleButton(),
        SizedBox(width: 12),
        _PreviousButton(),
        _PlayPauseButton(),
        _NextButton(),
        SizedBox(width: 12),
        _LoopButton(),
      ],
    );
  }
}

class _ShuffleButton extends GetView<SongDetailsPageController> {
  const _ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: controller.shuffle,
      icon: Image.asset(
        Images.shuffle,
        height: 32,
        width: 32,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

class _LoopButton extends StatelessWidget {
  const _LoopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: AudioPlayerService.loopMode == LoopMode.off
            ? const Icon(Icons.repeat)
            : const Icon(Icons.repeat_one),
        iconSize: 24.0,
        onPressed: AudioPlayerService.changeLoopMode,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

class _SongImage extends GetView<SongDetailsPageController> {
  const _SongImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(
          () => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 400,
              maxWidth: 400,
            ),
            child: Hero(
              tag: controller.currentSong!,
              placeholderBuilder: (context, heroSize, child) {
                return AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(
                    width: min(Get.width, Get.height),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: controller.currentSong?.previewImage ?? '',
                    width: min(Get.width, Get.height),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
    Color bgColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    Color iconColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Obx(() {
        final processingState = AudioPlayerService.audioProcessingState;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 40.0,
            height: 40.0,
            child: CircularProgressIndicator(color: iconColor),
          );
        } else if (!AudioPlayerService.isPlaying) {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 40.0,
            onPressed: AudioPlayerService.play,
            color: iconColor,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 40.0,
            onPressed: AudioPlayerService.pause,
            color: iconColor,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.replay),
            iconSize: 40.0,
            onPressed: AudioPlayerService.replay,
            color: iconColor,
          );
        }
      }),
    );
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

class _PreviousButton extends GetView<SongDetailsPageController> {
  const _PreviousButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: const Icon(Icons.skip_previous_sharp),
        iconSize: 40.0,
        onPressed: controller.previousSong != null
            ? controller.didTapPreviousSong
            : null,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}

class _NextButton extends GetView<SongDetailsPageController> {
  const _NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: const Icon(Icons.skip_next_sharp),
        iconSize: 40.0,
        onPressed:
            controller.nextSong != null ? controller.didTapNextSong : null,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
