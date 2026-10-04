import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/gradient_scaffold.dart';
import 'package:localink/core/widgets/illustration_placeholder.dart';

/// 1.2 Intro. Get started -> Language. Skip -> Guest Home.
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: Column(
          children: [
            const Spacer(flex: 2),
            // TODO(assets): replace with the intro illustration.
            const IllustrationPlaceholder(
              icon: Icons.near_me_rounded,
              size: 190,
              onDark: true,
            ),
            const SizedBox(height: 36),
            const Text(
              'Services, Places and Shops near you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                height: 1.15,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Book trusted providers, find shops and places, and get help fast.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.5,
                height: 1.45,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const Spacer(flex: 3),
            PrimaryButton(
              label: 'Get started',
              onDark: true,
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.language),
            ),
            const SizedBox(height: 10),
            GhostButton(
              label: 'Skip, explore as guest',
              onDark: true,
              onPressed: () {
                // Guest mode: Places, Shops and SOS stay open; Services/AI
                // ask for an account (see Sign up gate 2.3).
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.guestHome,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
