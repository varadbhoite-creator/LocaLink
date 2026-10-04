import 'package:flutter/material.dart';
import 'package:localink/core/theme/app_colors.dart';

/// Stand-in for the "P:" blocks in the design (illustration / map pin / badge).
/// TODO(assets): replace with real illustrations (SVG/PNG) when available.
class IllustrationPlaceholder extends StatelessWidget {
  const IllustrationPlaceholder({
    super.key,
    required this.icon,
    this.size = 160,
    this.color = AppColors.teal,
    this.onDark = false,
    this.circle = true,
  });

  final IconData icon;
  final double size;
  final Color color;
  final bool onDark;
  final bool circle;

  @override
  Widget build(BuildContext context) {
    final fg = onDark ? Colors.white : color;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : BorderRadius.circular(28),
        color: onDark ? Colors.white.withValues(alpha: 0.15) : null,
        gradient: onDark
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withValues(alpha: 0.20),
                  color.withValues(alpha: 0.08),
                ],
              ),
      ),
      child: Icon(icon, size: size * 0.45, color: fg),
    );
  }
}
