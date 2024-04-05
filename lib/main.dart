import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/app_controller.dart';
import 'package:music_player/app/services/app_services.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Awesome Music",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      onInit: () {
        Get.put(AppController());
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.black,
          linearTrackColor: Colors.black.withOpacity(0.1),
          linearMinHeight: 2,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.white,
          linearTrackColor: Colors.white.withOpacity(0.1),
          linearMinHeight: 2,
        ),
      ),
    ),
  );
}
