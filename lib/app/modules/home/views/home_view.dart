import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/utils/constants/enums.dart';
import 'package:music_player/app/widgets/base_error_view.dart';
import 'package:music_player/app/widgets/loader.dart';
import 'package:music_player/app/widgets/song_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: controller.search,
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(() {
        switch (controller.songsState) {
          case WidgetState.initial:
          case WidgetState.loading:
            return const LoaderWidget();
          case WidgetState.error:
            return BaseErrorView(onTryAgain: controller.fetchSongs);
          case WidgetState.success:
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemBuilder: (context, index) {
                final song = controller.songs[index];
                return SongCard(
                  song: song,
                  onTapFavourite: () {},
                  // isFavourite: controller.isMarkedFavourite(song.id!),
                  isFavourite: false,
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 10,
                thickness: 1,
                color: Theme.of(context).hintColor.withOpacity(0.05),
              ),
              itemCount: controller.songs.length,
            );
        }
      }),
    );
  }
}
