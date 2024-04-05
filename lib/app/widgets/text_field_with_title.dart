import 'package:flutter/material.dart';
import 'package:music_player/app/widgets/base_text_field.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final void Function(String? value)? onChanged;
  final String? hint;
  final String? errorText;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  const TextFieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    this.onChanged,
    this.hint,
    this.errorText,
    this.enabled = true,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        BaseTextField(
          controller: controller,
          onChanged: onChanged,
          errorText: errorText,
          hint: hint,
          enabled: enabled,
          maxLines: maxLines,
          minLines: minLines,
        ),
      ],
    );
  }
}
