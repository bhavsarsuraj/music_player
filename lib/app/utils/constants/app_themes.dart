import 'package:flutter/material.dart';
import 'package:music_player/app/utils/constants/font_family.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.sofiaPro,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.black,
      trackHeight: 2,
      thumbColor: Colors.black,
      inactiveTrackColor: Colors.black12,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: Colors.black12,
      linearMinHeight: 2,
      color: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: FontFamily.sofiaPro,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.white,
      trackHeight: 2,
      thumbColor: Colors.white,
      inactiveTrackColor: Colors.white30,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      linearTrackColor: Colors.white30,
      linearMinHeight: 2,
      color: Colors.white,
    ),
  );
}
