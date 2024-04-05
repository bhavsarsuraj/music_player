import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    checkAuthStatus();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkAuthStatus() {
    Get.find<AppController>().checkAuthStatus();
  }
}
