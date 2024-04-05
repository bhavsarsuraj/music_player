import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../controllers/song_details_page_controller.dart';

class SongDetailsPageView extends GetView<SongDetailsPageController> {
  const SongDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _ProgressBar(),
            const SizedBox(height: 12),
            const _PlayPauseButton(),
          ],
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
      final processingState = controller.audioProcessingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        return Container(
          margin: EdgeInsets.all(8.0),
          width: 64.0,
          height: 64.0,
          child: CircularProgressIndicator(),
        );
      } else if (!controller.isPlaying) {
        return IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 64.0,
          onPressed: controller.play,
        );
      } else if (processingState != ProcessingState.completed) {
        return IconButton(
          icon: Icon(Icons.pause),
          iconSize: 64.0,
          onPressed: controller.pause,
        );
      } else {
        return IconButton(
          icon: Icon(Icons.replay),
          iconSize: 64.0,
          onPressed: controller.replay,
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
            value: controller.songProgress,
            onChanged: controller.onChangeProgress,
            onChangeEnd: (_) {
              controller.playSongFromSpecifiDuration();
            },
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.currentDuration.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  controller.totalDuration.toString(),
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
