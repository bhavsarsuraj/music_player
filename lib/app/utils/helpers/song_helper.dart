import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/data/repositories/user_repository.dart';

abstract class SongHelper {
  SongHelper._();

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
      await UserRepository.updateFavouriteSongs(
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
      await UserRepository.updateFavouriteSongs(
        userId: _user!.id!,
        favouriteSongs: _user?.favouriteSongs ?? [],
      );
    } catch (_) {}
  }

  static bool isFavourite(String songId) {
    return _user?.favouriteSongs?.contains(songId) ?? false;
  }
}
