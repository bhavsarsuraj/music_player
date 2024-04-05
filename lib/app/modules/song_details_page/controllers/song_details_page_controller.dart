import 'package:get/get.dart';
import 'package:music_player/app/services/audio_player_service.dart';

class SongDetailsPageController extends GetxController {
  @override
  void onInit() {
    _configure();
    super.onInit();
  }

  void _configure() {
    configureSong();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    await AudioPlayerService.stop();
    super.onClose();
  }

  void configureSong() {
    AudioPlayerService.setUrl(
      'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3',
    );
  }
}
