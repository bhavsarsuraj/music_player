import 'package:flutter/material.dart';
import 'package:music_player/app/utils/constants/font_family.dart';

class Styles {
  static String get _font => FontFamily.sofiaPro;
  // light
  static TextStyle light(
    double size,
    Color color, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: _font,
      color: color,
      height: 1.25,
      fontSize: size,
      fontStyle: fontStyle,
      decoration: textDecoration,
      shadows: shadows,
    );
  }

  // regular
  static TextStyle regular(
    double size,
    Color color, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    List<Shadow>? shadows,
    String? fontFamily,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily ?? _font,
      color: color,
      height: 1.25,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size,
      shadows: shadows,
    );
  }

  // medium
  static TextStyle medium(
    double size,
    Color color, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: _font,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size,
      shadows: shadows,
    );
  }

  // semibold
  static TextStyle semibold(
    double size,
    Color color, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: _font,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size,
      shadows: shadows,
    );
  }

  // bold
  static TextStyle bold(
    double size,
    Color color, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: _font,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size,
      shadows: shadows,
    );
  }

  // italic
  static TextStyle italic(
    double size,
    Color color, {
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: _font,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size,
      fontStyle: FontStyle.italic,
      shadows: shadows,
    );
  }
}
