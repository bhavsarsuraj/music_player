import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/utils/constants/firestore_references.dart';

abstract class SongsRepository {
  SongsRepository._();

  static Future<List<Song>> fetchSongs({
    int currentPage = 0,
    int perPage = 20,
  }) async {
    final snapshot = await FirestoreReferences.songsRef.get();
    return snapshot.docs.map((doc) => Song.fromJson(doc.data())).toList();
    //TODO: Remove
    // final songsRef = FirebaseFirestore.instance.collection('songs');
    // final docId = songsRef.doc().id;
    // await songsRef.doc(docId).set({
    //   "title": 'Kisi Ki Muskurahaton Se',
    //   "preview_image":
    //       'https://lh3.googleusercontent.com/ooNfimZVb3v2HCMy6r1oaJr0oZ8EI8WryUwtgeVmXjoh_NN0-cKPLQuJaTfIZK3KpCn2YazYWsvyHkk=w544-h544-l90-rj',
    //   "url":
    //       'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3',
    //   "artists": [
    //     {
    //       "name": "Mukesh",
    //     }
    //   ],
    // });
    // return [];
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
