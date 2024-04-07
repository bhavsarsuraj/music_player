import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/services/app_services.dart';
import 'package:music_player/app/utils/constants/widget_keys.dart';
import 'package:music_player/app/widgets/primary_button.dart';
import 'package:music_player/main.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppServices.init();
  });

  testWidgets('Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Vertify sign up page
    expect(find.text('Sign In'), findsOneWidget);

    // Enter email and password to signup
    await tester.enterText(
      find.byKey(WidgetKeys.signInEmail),
      'suraj@gmail.com',
    );
    await tester.pump();

    await tester.enterText(
      find.byKey(WidgetKeys.signInPassword),
      '12345678',
    );
    await tester.pump();

    // Tap to signin
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    // Verify signed in details
    expect(find.text('Songs'), findsOneWidget);
    expect(Get.find<AppController>().firebaseUser, isNotNull);
    expect(Get.find<AppController>().userModel, isNotNull);
  });
}
