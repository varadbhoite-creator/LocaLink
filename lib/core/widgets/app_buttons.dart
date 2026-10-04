import 'package:flutter/material.dart';
import 'package:localink/core/theme/app_colors.dart';

/// Filled gradient button. Pass `onPressed: null` for the disabled look.
/// `onDark: true` gives the white button used on the teal gradient screens.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.onDark = false,
    this.leading,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool onDark;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final fg = !enabled
        ? AppColors.mute
        : (onDark ? AppColors.teal : Colors.white);

    return SizedBox(
      width: double.infinity,
      height: 52, // >= 48 px touch target
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: enabled && !onDark ? AppColors.primaryGradient : null,
          color: !enabled
              ? AppColors.line
              : (onDark ? Colors.white : null),
          borderRadius: BorderRadius.circular(12),
          boxShadow: enabled && !onDark
              ? [
                  BoxShadow(
                    color: AppColors.teal.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onPressed,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) ...[leading!, const SizedBox(width: 8)],
                  Text(
                    label,
                    style: TextStyle(
                      color: fg,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Outlined secondary button.
class GhostButton extends StatelessWidget {
  const GhostButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.onDark = false,
    this.leading,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool onDark;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final fg = onDark ? Colors.white : AppColors.teal;
    final border = onDark
        ? Colors.white.withValues(alpha: 0.55)
        : AppColors.teal.withValues(alpha: 0.45);

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: onDark ? Colors.transparent : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: border, width: 1.5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 8)],
                Text(
                  label,
                  style: TextStyle(
                    color: fg,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
