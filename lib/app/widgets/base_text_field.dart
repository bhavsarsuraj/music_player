import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String? value)? onChanged;
  final String? hint;
  final String? errorText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;

  const BaseTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.hint,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.suffix,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: prefix,
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          maxWidth: 24,
          minHeight: 20,
          minWidth: 24,
        ),
        suffixIcon: suffix,
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).hintColor),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        errorText: errorText,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        counterStyle: const TextStyle(height: double.minPositive),
        counterText: '',
        prefixStyle: Theme.of(context).inputDecorationTheme.prefixStyle,
      ),
      obscureText: obscureText,
      autofocus: autofocus,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
      cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
      textAlign: TextAlign.start,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
