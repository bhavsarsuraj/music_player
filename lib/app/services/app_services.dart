import 'package:music_player/app/services/audio_player_service.dart';

abstract class AppServices {
  AppServices._();

  static void init() {
    // Initialise all services here
    AudioPlayerService.init();
  }
}
