import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/utils/constants/firestore_references.dart';

abstract class UserRepository {
  UserRepository._();

  static Future<UserModel?> getCurrentUser() async {
    final userId = Get.find<AppController>().firebaseUser?.uid;
    final snapshot = await FirestoreReferences.usersRef.doc(userId).get();
    if (snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<void> markSongFavourite(String songId) async {
    final user = Get.find<AppController>().userModel;
    List<String> favouriteSongs = user?.favouriteSongs ?? [];
    if (!favouriteSongs.contains(songId)) {
      favouriteSongs.add(songId);
    }
    await FirestoreReferences.usersRef.doc().update({
      "favourite_songs": favouriteSongs,
    });
  }
}
