import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';

abstract class SongHelper {
  SongHelper._();

  static final userRepository = UserRepository(FirebaseFirestore.instance);

  static UserModel? get _user {
    return Get.find<AppController>().userModel;
  }

  static Future<void> markFavourite(
    String songId,
  ) async {
    try {
      if (!(_user?.favouriteSongs?.contains(songId) ?? false)) {
        if (_user?.favouriteSongs == null) _user?.favouriteSongs = [];
        _user?.favouriteSongs?.add(songId);
      }
      Get.find<AppController>().refreshUserModel();
      await userRepository.updateFavouriteSongs(
        userId: _user!.id!,
        favouriteSongs: _user?.favouriteSongs ?? [],
      );
    } catch (_) {}
  }

  static Future<void> removeFromFavourite(
    String songId,
  ) async {
    try {
      if (_user?.favouriteSongs?.contains(songId) ?? false) {
        _user?.favouriteSongs?.remove(songId);
      }
      Get.find<AppController>().refreshUserModel();
      await userRepository.updateFavouriteSongs(
        userId: _user!.id!,
        favouriteSongs: _user?.favouriteSongs ?? [],
      );
    } catch (_) {}
  }

  static bool isFavourite(String songId) {
    return _user?.favouriteSongs?.contains(songId) ?? false;
  }

  static String concatenateStrings(List<String> strings) {
    if (strings.isEmpty) return '';

    if (strings.length == 1) {
      return strings[0];
    } else if (strings.length == 2) {
      return '${strings[0]} & ${strings[1]}';
    } else {
      String concatenated = '';
      for (int i = 0; i < strings.length - 1; i++) {
        concatenated += '${strings[i]}, ';
      }
      concatenated = concatenated.substring(0, concatenated.length - 2);
      concatenated += ' & ${strings.last}';
      return concatenated;
    }
  }
}
