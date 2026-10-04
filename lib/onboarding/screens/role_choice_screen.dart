import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';

/// 1.4 Role choice. Continue -> Sign in or register (with the chosen role).
/// "I already have an account" -> Sign in screen in log-in mode.
class RoleChoiceScreen extends StatefulWidget {
  const RoleChoiceScreen({super.key});

  @override
  State<RoleChoiceScreen> createState() => _RoleChoiceScreenState();
}

class _RoleChoiceScreenState extends State<RoleChoiceScreen> {
  UserRole? _selected; // UI selection only

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'I am a',
      subtitle: 'Pick how you will use LocaLink.',
      actions: [
        PrimaryButton(
          label: 'Continue',
          // Disabled until a role is picked.
          onPressed: _selected == null
              ? null
              : () => Navigator.of(context).pushNamed(
                    AppRoutes.auth,
                    arguments: AuthArgs(role: _selected),
                  ),
        ),
        GhostButton(
          label: 'I already have an account',
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.auth,
            arguments: const AuthArgs(isLogin: true),
          ),
        ),
      ],
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
        children: [
          for (final role in UserRole.values)
            _RoleCard(
              role: role,
              selected: _selected == role,
              onTap: () => setState(() => _selected = role),
            ),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.role,
    required this.selected,
    required this.onTap,
  });

  final UserRole role;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: selected ? 0 : 1,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: selected ? role.color : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: role.color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(role.icon, size: 28, color: role.color),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      role.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 20,
                  color: role.color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
