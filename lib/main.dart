import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),
      ),
    ),
  );
}
