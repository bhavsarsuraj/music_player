import 'package:firebase_core/firebase_core.dart';
import 'package:music_player/app/services/audio_player_service.dart';
import 'package:music_player/firebase_options.dart';

abstract class AppServices {
  AppServices._();

  static Future<void> init() async {
    // Initialise all services here
    AudioPlayerService.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
