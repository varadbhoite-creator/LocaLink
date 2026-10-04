import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';

/// 1.3 Language. Shown on first launch only. Continue -> Role choice.
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // (code, English name, native name)
  static const _languages = [
    ('en', 'English', 'English'),
    ('hi', 'Hindi', 'हिन्दी'),
    ('mr', 'Marathi', 'मराठी'),
  ];

  String _selected = 'en'; // UI selection only

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Choose language',
      subtitle: 'You can change this later in Settings.',
      actions: [
        PrimaryButton(
          label: 'Continue',
          onPressed: () {
            // TODO(backend): persist the choice and apply the locale.
            //   Local: shared_preferences (key "locale"), then rebuild
            //   MaterialApp(locale: ...) via your state holder.
            //   Remote (after sign-up): save to Supabase `profiles.language`
            //   or Firestore users/{uid}.language.
            // TODO(l10n): add flutter_localizations + ARB files for en/hi/mr.
            Navigator.of(context).pushNamed(AppRoutes.roleChoice);
          },
        ),
      ],
      child: Column(
        children: [
          for (final l in _languages) ...[
            _LanguageTile(
              english: l.$2,
              native: l.$3,
              selected: _selected == l.$1,
              onTap: () => setState(() => _selected = l.$1),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.english,
    required this.native,
    required this.selected,
    required this.onTap,
  });

  final String english;
  final String native;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: selected ? AppColors.teal : AppColors.line,
          width: selected ? 1.8 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      native,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                    if (native != english)
                      Text(
                        english,
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: AppColors.mute,
                        ),
                      ),
                  ],
                ),
              ),
              Icon(
                selected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: selected ? AppColors.teal : AppColors.hint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
