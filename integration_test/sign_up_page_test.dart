import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
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

  testWidgets('Sign Up', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Navigate to signup page
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Vertify sign up page
    expect(find.text('Sign Up'), findsOneWidget);

    // Enter email and password to signup
    await tester.enterText(
      find.byKey(WidgetKeys.signUpEmail),
      'testeruser@gmail.com',
    );
    await tester.pump();

    await tester.enterText(
      find.byKey(WidgetKeys.signUpPassword),
      'SignupPassword',
    );
    await tester.pump();

    await tester.enterText(
      find.byKey(WidgetKeys.signUpConfirmPassword),
      'SignupPassword',
    );
    await tester.pump();

    // Tap to signup
    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    // Account created
    expect(find.text('Account created successfully'), findsOneWidget);
  });
}
