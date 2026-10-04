import 'package:flutter/material.dart';

/// Design tokens taken from "LocaLink - UI and UX v2" (Design system section).
class AppColors {
  AppColors._();

  // Brand / category colours
  static const teal = Color(0xFF0E5E63); // Services, primary
  static const indigo = Color(0xFF3D4F9F); // Places
  static const amber = Color(0xFFB97800); // Shops
  static const red = Color(0xFFC0392B); // SOS only

  // Neutrals
  static const background = Color(0xFFF6F9F8);
  static const ink = Color(0xFF14262B);
  static const mute = Color(0xFF66777A);
  static const hint = Color(0xFF9AA9AB);
  static const line = Color(0xFFDDE6E5);

  // Teal mixed 45% with black (used for gradients)
  static const tealDeep = Color(0xFF083437);

  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [teal, Color(0xFF0A4A4E)],
  );

  static const splashGradient = LinearGradient(
    begin: Alignment(-0.4, -1),
    end: Alignment(0.4, 1),
    colors: [teal, tealDeep],
  );
}
