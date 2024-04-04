import 'package:get/get.dart';

import '../controllers/song_details_page_controller.dart';

class SongDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongDetailsPageController>(
      () => SongDetailsPageController(),
    );
  }
}
