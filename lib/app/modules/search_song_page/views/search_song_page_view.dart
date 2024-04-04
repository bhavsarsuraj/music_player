import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_song_page_controller.dart';

class SearchSongPageView extends GetView<SearchSongPageController> {
  const SearchSongPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchSongPageView'),
        centerTitle: true,
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
