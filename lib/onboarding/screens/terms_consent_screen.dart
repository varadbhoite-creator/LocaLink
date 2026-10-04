import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';

/// NEW: Terms and privacy consent. Needed before collecting ID and location.
/// Auth (1.5) -> here -> Verify phone (1.6).
class TermsConsentScreen extends StatefulWidget {
  const TermsConsentScreen({super.key, this.args});
  final AuthArgs? args;

  @override
  State<TermsConsentScreen> createState() => _TermsConsentScreenState();
}

class _TermsConsentScreenState extends State<TermsConsentScreen> {
  bool _accepted = false; // UI state only

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Before we continue',
      subtitle: 'Please review how LocaLink uses your information.',
      actions: [
        PrimaryButton(
          label: 'Accept and continue',
          onPressed: !_accepted
              ? null
              : () {
                  // TODO(backend): store consent with a timestamp and the
                  //   policy version (Supabase `profiles.terms_accepted_at`
                  //   or Firestore users/{uid}.termsAcceptedAt).
                  Navigator.of(context).pushNamed(
                    AppRoutes.verifyPhone,
                    arguments: widget.args,
                  );
                },
        ),
      ],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.line),
            ),
            child: const Column(
              children: [
                _Point(
                  icon: Icons.phone_iphone_rounded,
                  text: 'Your phone number is used to verify your account.',
                ),
                SizedBox(height: 12),
                _Point(
                  icon: Icons.place_rounded,
                  text: 'Your location is used to show what is nearby.',
                ),
                SizedBox(height: 12),
                _Point(
                  icon: Icons.badge_rounded,
                  text:
                      'Providers and owners upload ID documents for verification.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _DocLink(
            label: 'Terms of Service',
            onTap: () {
              // TODO(content): open the Terms page (WebView / url_launcher / in-app screen).
            },
          ),
          const SizedBox(height: 8),
          _DocLink(
            label: 'Privacy Policy',
            onTap: () {
              // TODO(content): open the Privacy Policy page.
            },
          ),
          const SizedBox(height: 14),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => setState(() => _accepted = !_accepted),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Checkbox(
                    value: _accepted,
                    activeColor: AppColors.teal,
                    onChanged: (v) => setState(() => _accepted = v ?? false),
                  ),
                  const Expanded(
                    child: Text(
                      'I agree to the Terms of Service and Privacy Policy',
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Point extends StatelessWidget {
  const _Point({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.teal.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: AppColors.teal),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13.5,
                height: 1.4,
                color: AppColors.ink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DocLink extends StatelessWidget {
  const _DocLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.line),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Read $label',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColors.ink,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: AppColors.hint),
            ],
          ),
        ),
      ),
    );
  }
}
