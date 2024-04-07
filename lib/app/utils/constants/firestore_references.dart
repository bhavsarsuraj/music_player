import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/app/utils/constants/firestore_collections.dart';

class FirestoreReferences {
  FirestoreReferences._();
  static FirebaseFirestore _instance = FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> get usersRef =>
      _instance.collection(FirestoreCollections.users);
  static CollectionReference<Map<String, dynamic>> get songsRef =>
      _instance.collection(FirestoreCollections.songs);
}
