import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/widgets/gradient_scaffold.dart';

/// 1.1 Splash. Opens by itself, then goes to Intro.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 2200), _goNext);
  }

  void _goNext() {
    if (!mounted) return;

    // TODO(backend): check for an existing session before navigating.
    //   Supabase: Supabase.instance.client.auth.currentSession
    //   Firebase: FirebaseAuth.instance.currentUser
    // If signed in -> pushReplacementNamed(context, AppRoutes.home)
    //   (or the dashboard that matches the stored role).
    // TODO(backend): also read a local "seen onboarding" flag
    //   (shared_preferences) so Language is first-launch only.

    Navigator.of(context).pushReplacementNamed(AppRoutes.intro);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO(assets): replace with the real LocaLink logo.
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.place_rounded,
                size: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'LocaLink',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Find help near you',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
