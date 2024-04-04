import 'package:get/get.dart';
import 'package:music_player/app/routes/app_pages.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void search() {
    Get.toNamed(Routes.SEARCH_SONG_PAGE);
  }
}
