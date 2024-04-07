import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:music_player/app/services/app_services.dart';
import 'package:music_player/app/services/audio_player_service.dart';
import 'package:music_player/app/widgets/song_card.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late AppController appController;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppServices.init();
    appController = AppController();
  });

  testWidgets(
    'Search song and play',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: Routes.HOME,
          getPages: AppPages.routes,
          onInit: () {
            Get.put(appController);
            Get.put(HomeController());
          },
        ),
      );

      // Navigate to search songs page
      final searchIcon = find.byWidgetPredicate(
        (widget) => widget is Icon && widget.icon == Icons.search,
      );
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();

      // Verify search songs page
      expect(find.byType(CupertinoSearchTextField), findsOneWidget);

      // Enter search query
      await tester.enterText(find.byType(CupertinoSearchTextField), 'Chaiyan');
      await tester.pumpAndSettle();

      // Verify search result
      expect(find.byType(SongCard), findsOneWidget);

      // Tap song to play
      await tester.tap(find.byType(SongCard));
      await tester.pumpAndSettle();

      // Verify song details page
      expect(find.byType(Slider), findsOneWidget);
      expect(AudioPlayerService.song, isNotNull);
    },
  );

  testWidgets('Search song which does not exists', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
        onInit: () {
          Get.put(appController);
          Get.put(HomeController());
        },
      ),
    );

    // Navigate to search songs page
    final searchIcon = find.byWidgetPredicate(
      (widget) => widget is Icon && widget.icon == Icons.search,
    );
    await tester.tap(searchIcon);
    await tester.pumpAndSettle();

    // Enter search query
    await tester.enterText(
      find.byType(CupertinoSearchTextField),
      'nonexistingsong',
    );
    await tester.pumpAndSettle();

    // Verify empty search result
    expect(find.byType(SongCard), findsNothing);
    expect(find.text('No songs found!'), findsOneWidget);
  });
}
