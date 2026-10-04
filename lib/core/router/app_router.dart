import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';
import 'package:localink/onboarding/screens/auth_screen.dart';
import 'package:localink/onboarding/screens/choose_area_screen.dart';
import 'package:localink/onboarding/screens/customer_info_screen.dart';
import 'package:localink/onboarding/screens/intro_screen.dart';
import 'package:localink/onboarding/screens/language_screen.dart';
import 'package:localink/onboarding/screens/location_permission_screen.dart';
import 'package:localink/onboarding/screens/role_choice_screen.dart';
import 'package:localink/onboarding/screens/splash_screen.dart';
import 'package:localink/onboarding/screens/terms_consent_screen.dart';
import 'package:localink/onboarding/screens/verify_phone_screen.dart';

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({
    required this.title,
    required this.note,
  });

  final String title;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            note,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

/// Central route table. Add new screens here as later phases are built.
class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    final Widget page = switch (settings.name) {
      // --- Onboarding ---
      AppRoutes.splash => const SplashScreen(),
      AppRoutes.intro => const IntroScreen(),
      AppRoutes.language => const LanguageScreen(),
      AppRoutes.roleChoice => const RoleChoiceScreen(),
      AppRoutes.auth => AuthScreen(args: args is AuthArgs ? args : null),
      AppRoutes.terms =>
        TermsConsentScreen(args: args is AuthArgs ? args : null),
      AppRoutes.verifyPhone =>
        VerifyPhoneScreen(args: args is AuthArgs ? args : null),
      AppRoutes.customerInfo => const CustomerInfoScreen(),
      AppRoutes.locationPermission => const LocationPermissionScreen(),
      AppRoutes.chooseArea =>
        ChooseAreaScreen(args: args is ChooseAreaArgs ? args : null),

      // --- Next phases: replace each placeholder with the real screen ---
      AppRoutes.guestHome => const _PlaceholderScreen(
          title: 'Guest Home (2.1)',
          note: 'Build the Guest Home screen here.',
        ),
      AppRoutes.home => const _PlaceholderScreen(
          title: 'Home (2.2)',
          note: 'Onboarding finished. Build the customer Home screen here.',
        ),
      AppRoutes.providerRegister => const _PlaceholderScreen(
          title: 'Provider register (6.1)',
          note: 'Provider registration step 1 goes here.',
        ),
      AppRoutes.shopRegister => const _PlaceholderScreen(
          title: 'Register shop (7.1)',
          note: 'Shop owner registration step 1 goes here.',
        ),
      AppRoutes.placeRegister => const _PlaceholderScreen(
          title: 'Register place (7.5)',
          note: 'Place owner registration step 1 goes here.',
        ),

      _ => const _PlaceholderScreen(
          title: 'Not found',
          note: 'No screen is registered for this route.',
        ),
    };

    return MaterialPageRoute<void>(settings: settings, builder: (_) => page);
  }
}
