import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/utils/constants/enums.dart';
import 'package:music_player/app/widgets/base_error_view.dart';
import 'package:music_player/app/widgets/current_playing_song.dart';
import 'package:music_player/app/widgets/loader.dart';
import 'package:music_player/app/widgets/song_card.dart';
import '../controllers/search_song_page_controller.dart';

class SearchSongPageView extends GetView<SearchSongPageController> {
  const SearchSongPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CupertinoSearchTextField(
              controller: controller.searchController,
              onChanged: controller.onChangeQuery,
              placeholder: 'Search songs',
              autofocus: true,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends GetView<SearchSongPageController> {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(() {
          switch (controller.searchState) {
            case WidgetState.initial:
              return Container();
            case WidgetState.loading:
              return const LoaderWidget();
            case WidgetState.error:
              return BaseErrorView(onTryAgain: controller.getSearchResults);
            case WidgetState.success:
              if (controller.filteredSongs.isEmpty) {
                return Center(child: const _EmptySearchResults());
              } else {
                return ListView.separated(
                  padding: EdgeInsets.only(
                    left: 16,
                    top: 16,
                    bottom: 100,
                  ),
                  itemBuilder: (context, index) {
                    final song = controller.filteredSongs[index];
                    return Obx(
                      () => SongCard(
                        song: song,
                        isFavourite: controller.isFavourite(song),
                        onPressedFavourite: () =>
                            controller.onPressedFavourite(song),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 10,
                    thickness: 1,
                    color: Theme.of(context).hintColor.withOpacity(0.05),
                  ),
                  itemCount: controller.filteredSongs.length,
                );
              }
          }
        }),
        const CurrentPlayingSong(),
      ],
    );
  }
}

class _EmptySearchResults extends StatelessWidget {
  const _EmptySearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          color: Theme.of(context).iconTheme.color,
          size: 72,
        ),
        const SizedBox(height: 12),
        Text(
          'No songs found!',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
