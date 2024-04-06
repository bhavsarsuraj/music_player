import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:music_player/app/data/models/artist.dart';
import 'package:music_player/app/data/models/song.dart';
import 'package:music_player/app/widgets/favourite_animated_widget.dart';
import 'package:music_player/app/widgets/song_card.dart';

void main() {
  setUp(() async {
    Get.testMode = true;
  });

  testWidgets('Check song details', (WidgetTester tester) async {
    final song = Song(
      id: '1',
      title: 'Song Title',
      previewImage: 'preview_image',
      url: 'url',
      artists: [
        Artist(
          name: 'Artist 1',
        ),
        Artist(
          name: 'Artist 2',
        ),
      ],
    );
    bool isFavourite = false;

    await tester.pumpWidget(
      MaterialApp(
        home: SongCard(
          song: song,
          isFavourite: isFavourite,
          onPressedFavourite: () {
            isFavourite = true;
          },
        ),
      ),
    );

    expect(find.text('Song Title'), findsOneWidget);
    expect(find.text('Artist 1 & Artist 2'), findsOneWidget);
    expect(find.byType(Hero), findsOneWidget);
    expect(find.byType(FavouriteAnimationWidget), findsOneWidget);
  });
}
