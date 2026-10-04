import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localink/core/theme/app_colors.dart';

/// Labelled text field styled to the design. UI only: pass a controller when
/// you wire up the backend.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.label,
    this.icon,
    this.prefixText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.letterSpacing,
    this.textAlign = TextAlign.start,
    this.digitsOnly = false,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  final String hint;
  final String? label;
  final IconData? icon;
  final String? prefixText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final double? letterSpacing;
  final TextAlign textAlign;
  final bool digitsOnly;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLength: maxLength,
          textAlign: textAlign,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          inputFormatters:
              digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
            letterSpacing: letterSpacing,
          ),
          decoration: InputDecoration(
            hintText: hint,
            counterText: '',
            prefixIcon: icon == null
                ? null
                : Icon(icon, size: 20, color: AppColors.mute),
            prefixText: prefixText,
            prefixStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}
