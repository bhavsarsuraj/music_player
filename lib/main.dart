import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/services/app_services.dart';
import 'package:music_player/app/utils/constants/app_themes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();

  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Melody Mix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      onInit: () {
        Get.put(AppController());
      },
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child,
        );
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
    );
  }
}
