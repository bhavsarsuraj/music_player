import 'package:get/get.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/services/audio_player_service.dart';

class SongDetailsPageArguments {
  final Song song;
  SongDetailsPageArguments({required this.song});
}

class SongDetailsPageController extends GetxController {
  final SongDetailsPageArguments? arguments;
  SongDetailsPageController({this.arguments});

  bool _isValid = true;

  @override
  void onInit() {
    configure();
    super.onInit();
  }

  void configure() {
    _isValid = arguments != null && arguments is SongDetailsPageArguments;
    if (!_isValid) {
      return;
    }
    configureSong();
  }

  @override
  void onReady() {
    if (!_isValid) {
      Get.back();
      return;
    }
    super.onReady();
  }

  @override
  void onClose() async {
    await AudioPlayerService.stop();
    super.onClose();
  }

  void configureSong() {
    AudioPlayerService.setUrl(arguments?.song.url ?? '');
  }
}
