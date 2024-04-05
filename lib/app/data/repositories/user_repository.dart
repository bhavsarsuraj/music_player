import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/utils/constants/firestore_references.dart';

abstract class UserRepository {
  UserRepository._();

  static Future<void> setCurrentUser(UserModel user) async {
    FirestoreReferences.usersRef.doc(user.id).set(user.toJson());
  }

  static Future<UserModel?> getUser(String id) async {
    final snapshot = await FirestoreReferences.usersRef.doc(id).get();
    if (snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  static Future<void> updateFavouriteSongs({
    required String userId,
    required List<String> favouriteSongs,
  }) async {
    await FirestoreReferences.usersRef.doc(userId).update({
      "favourite_songs": favouriteSongs,
    });
  }
}
