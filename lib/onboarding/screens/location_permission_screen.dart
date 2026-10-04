import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/illustration_placeholder.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';

/// 1.8 Location permission.
/// Allow -> Home (2.2). Enter area manually -> Choose area -> Home.
class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  void _goHome(BuildContext context) {
    // Onboarding is finished: clear the back stack.
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Allow location',
      subtitle: 'Allow location to see what is nearby.',
      actions: [
        PrimaryButton(
          label: 'Allow',
          onPressed: () {
            // TODO(permission): request location permission.
            //   Packages: geolocator or permission_handler (also add the
            //   Android manifest / iOS Info.plist entries).
            // TODO(backend): save the coordinates to the user's profile
            //   (Supabase PostGIS `geography` column / Firestore GeoPoint).
            // Whether granted or denied, move on (denied -> Choose area).
            _goHome(context);
          },
        ),
        GhostButton(
          label: 'Enter area manually',
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.chooseArea,
            arguments: const ChooseAreaArgs(nextRoute: AppRoutes.home),
          ),
        ),
      ],
      child: const Column(
        children: [
          SizedBox(height: 24),
          // TODO(assets): replace with the map-pin illustration.
          Center(
            child: IllustrationPlaceholder(
              icon: Icons.location_on_rounded,
              size: 170,
              color: AppColors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
