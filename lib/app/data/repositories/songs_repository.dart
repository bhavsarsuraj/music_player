import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/utils/constants/firestore_references.dart';

abstract class SongsRepository {
  SongsRepository._();

  static Future<(List<Song>, DocumentSnapshot<Map<String, dynamic>>?)>
      fetchSongs({
    int perPage = 15,
    DocumentSnapshot<Map<String, dynamic>>? startAfterDoc,
  }) async {
    final query = FirestoreReferences.songsRef
        .orderBy('id', descending: true)
        .limit(perPage);

    final querySnapshot = startAfterDoc != null
        ? await query.startAfterDocument(startAfterDoc).get()
        : await query.get();

    final finalDoc =
        querySnapshot.docs.length == perPage ? querySnapshot.docs.last : null;

    return (
      querySnapshot.docs.map((doc) => Song.fromJson(doc.data())).toList(),
      finalDoc,
    );
  }

  static Future<List<Song>> getSongsByQuery(String query) async {
    final snapshot = await FirestoreReferences.songsRef.get();
    return snapshot.docs
        .map((doc) => Song.fromJson(doc.data()))
        .where((song) =>
            song.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();
  }

  //TODO: Remove
  // static void runScript() async {
  //   for (int i = 0; i < songs.length; i++) {
  //     final song = songs[i];
  //     final id = FirestoreReferences.songsRef.doc().id;
  //     song["id"] = id;

  //     await FirestoreReferences.songsRef.doc(id).set(song);
  //     print('Uploaded Song $song');
  //   }
  // }
}
