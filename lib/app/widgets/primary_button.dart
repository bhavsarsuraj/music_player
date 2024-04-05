import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Widget? child;
  final BorderRadius? borderRadius;

  const PrimaryButton({
    super.key,
    this.text,
    this.onTap,
    this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    Color? textColor;
    if (Theme.of(context).brightness == Brightness.dark) {
      textColor = onTap != null ? Colors.black : Colors.white;
    } else {
      textColor = onTap != null ? Colors.white : Colors.black;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 20),
        backgroundColor:
            onTap != null ? backgroundColor : backgroundColor.withOpacity(0.1),
        fixedSize: Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(48),
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: child ??
            Text(
              text ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: (onTap != null)
                        ? textColor
                        : textColor.withOpacity(0.2),
                  ),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
