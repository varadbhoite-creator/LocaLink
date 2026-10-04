import 'package:flutter/material.dart';
import 'package:localink/core/theme/app_colors.dart';

/// Role chosen on screen 1.4. UI-only enum; map it to your backend role value
/// (Firebase custom claim / Supabase `profiles.role`) later.
enum UserRole {
  customer('Customer', Icons.person_rounded, AppColors.teal),
  provider('Service provider', Icons.handyman_rounded, AppColors.teal),
  shopOwner('Shop owner', Icons.storefront_rounded, AppColors.amber),
  placeOwner('Place owner', Icons.apartment_rounded, AppColors.indigo);

  const UserRole(this.label, this.icon, this.color);
  final String label;
  final IconData icon;
  final Color color;
}

/// Passed from Role choice -> Auth -> Terms -> Verify phone.
class AuthArgs {
  const AuthArgs({this.role, this.isLogin = false});

  /// null when the user tapped "I already have an account".
  final UserRole? role;
  final bool isLogin;
}

/// Passed to Choose area manually so it knows where to go next.
class ChooseAreaArgs {
  const ChooseAreaArgs({required this.nextRoute});
  final String nextRoute;
}
