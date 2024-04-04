import 'package:get/get.dart';

import '../controllers/search_song_page_controller.dart';

class SearchSongPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSongPageController>(
      () => SearchSongPageController(),
    );
  }
}
