import 'package:flutter/material.dart';
import 'package:music_player/app/utils/constants/images.dart';

class PasswordIconButton extends StatelessWidget {
  final bool showPassword;
  final VoidCallback onPressed;
  const PasswordIconButton({
    super.key,
    required this.showPassword,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        showPassword ? Images.visiblePassword : Images.hidePassword,
        height: 16,
        width: 16,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
