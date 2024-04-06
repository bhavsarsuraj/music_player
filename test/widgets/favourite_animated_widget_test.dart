import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/app/widgets/favourite_animated_widget.dart';

void main() {
  testWidgets('Tap for making favourite', (WidgetTester tester) async {
    bool isFavourite = false;

    await tester.pumpWidget(
      MaterialApp(
        home: FavouriteAnimationWidget(
          isFavourite: isFavourite,
          onPressed: () {
            isFavourite = !isFavourite;
          },
        ),
      ),
    );

    final iconBeforeTapping = tester.widget<Icon>(find.byIcon(Icons.favorite));
    expect(iconBeforeTapping.color, Colors.grey);

    // Tap the widget
    await tester.tap(find.byType(FavouriteAnimationWidget));

    // Rebuild the widget
    await tester.pump();

    final iconAfterTapping = tester.widget<Icon>(find.byIcon(Icons.favorite));
    expect(iconAfterTapping.color, Colors.pink);
  });

  testWidgets('Tap for removing from favourite', (WidgetTester tester) async {
    bool isFavourite = true;

    await tester.pumpWidget(
      MaterialApp(
        home: FavouriteAnimationWidget(
          isFavourite: isFavourite,
          onPressed: () {
            isFavourite = false;
          },
        ),
      ),
    );

    final iconBeforeTapping = tester.widget<Icon>(find.byIcon(Icons.favorite));
    expect(iconBeforeTapping.color, Colors.pink);

    await tester.tap(find.byType(FavouriteAnimationWidget));

    await tester.pump();

    final iconAfterTapping = tester.widget<Icon>(find.byIcon(Icons.favorite));
    expect(iconAfterTapping.color, Colors.grey);
  });
}
