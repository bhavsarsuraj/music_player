import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/app/data/models/artist.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/data/repositories/songs_repository.dart';

void main() {
  group('Songs Repository', () {
    late FakeFirebaseFirestore instance;
    late SongsRepository songsRepository;

    setUp(() {
      instance = FakeFirebaseFirestore();
      songsRepository = SongsRepository(instance);
    });

    test('Fetch songs', () async {
      final song = Song(
        id: '1',
        artists: [Artist(name: 'Artist 1')],
        previewImage: 'preview_image',
        title: 'Song 1',
        url: 'url1',
      );
      await instance.collection('songs').doc('1').set(song.toJson());
      final songsResponse = await songsRepository.fetchSongs(perPage: 1);

      expect(songsResponse.$1.isNotEmpty, true);
      expect(songsResponse.$1.first.toJson(), song.toJson());
      expect(songsResponse.$2, isNotNull);
      expect(songsResponse.$2!.data(), song.toJson());
    });

    test('Get songs by query when matched', () async {
      final song = Song(
        id: '1',
        artists: [Artist(name: 'Artist')],
        previewImage: 'preview_image',
        title: 'Song',
        url: 'url',
      );
      final query = 'Song';

      await instance.collection('songs').doc('1').set(song.toJson());
      final songs = await songsRepository.getSongsByQuery(query);

      expect(songs.length, 1);
      expect(songs.first.toJson(), song.toJson());
    });

    test('Get songs by query when not matched', () async {
      final song = Song(
        id: '1',
        artists: [Artist(name: 'Artist')],
        previewImage: 'preview_image',
        title: 'Song',
        url: 'url',
      );
      final query = 'xyz';

      await instance.collection('songs').doc('1').set(song.toJson());
      final songs = await songsRepository.getSongsByQuery(query);

      expect(songs.length, 0);
    });
  });
}
