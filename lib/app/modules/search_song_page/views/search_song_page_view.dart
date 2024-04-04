import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_song_page_controller.dart';

class SearchSongPageView extends GetView<SearchSongPageController> {
  const SearchSongPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CupertinoSearchTextField(
            controller: controller.searchController,
            onChanged: controller.onChangeQuery,
            placeholder: 'Search songs',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'SearchSongPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
