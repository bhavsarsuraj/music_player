import 'package:flutter/material.dart';

class DarkThemeGradients {
  DarkThemeGradients._();

  static LinearGradient get gradient {
    return LinearGradient(
      colors: [
        Color(0xFF5C4033),
        Color(0xFF5C4033).withOpacity(0.5),
      ],
      stops: [0.1, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}

class LightThemeGradients {
  LightThemeGradients._();

  static LinearGradient get gradient {
    return LinearGradient(
      colors: [
        Color(0xFFEAD7E8),
        Color(0xFF97D9E1),
      ],
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
