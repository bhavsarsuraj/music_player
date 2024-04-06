import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/app/data/models/user_model.dart';
import 'package:music_player/app/utils/constants/firestore_collections.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  Future<void> setCurrentUser(UserModel user) async {
    await _firestore
        .collection(FirestoreCollections.users)
        .doc(user.id)
        .set(user.toJson());
  }

  Future<UserModel?> getUser(String id) async {
    final snapshot =
        await _firestore.collection(FirestoreCollections.users).doc(id).get();
    if (snapshot.data() != null) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  Future<void> updateFavouriteSongs({
    required String userId,
    required List<String> favouriteSongs,
  }) async {
    await _firestore.collection(FirestoreCollections.users).doc(userId).update({
      "favourite_songs": favouriteSongs,
    });
  }
}
