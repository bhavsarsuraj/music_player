import 'package:flutter/material.dart';
import 'package:music_player/app/utils/constants/gradients.dart';

class BaseGradientContainer extends StatelessWidget {
  final Widget child;
  const BaseGradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: isDarkMode
            ? DarkThemeGradients.gradient
            : LightThemeGradients.gradient,
      ),
      child: child,
    );
  }
}
