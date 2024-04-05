import 'package:get/get.dart';
import '../controllers/song_details_page_controller.dart';

class SongDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    _setupArgs();
  }

  void _setupArgs() {
    final args = Get.arguments;
    SongDetailsPageArguments? arguments;
    try {
      if (args is SongDetailsPageArguments) {
        arguments = args;
      } else {
        // To be handled inside Controller
      }
    } catch (e) {
      // To be handled inside Controller
    }
    Get.put<SongDetailsPageController>(
      SongDetailsPageController(arguments: arguments),
    );
  }
}
