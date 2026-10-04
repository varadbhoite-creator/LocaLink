import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localink/core/theme/app_colors.dart';

/// Full-screen teal gradient used by Splash (1.1) and Intro (1.2).
class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(gradient: AppColors.splashGradient),
          child: SafeArea(child: child),
        ),
      ),
    );
  }
}
