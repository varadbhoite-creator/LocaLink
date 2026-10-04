import 'package:flutter/material.dart';
import 'package:localink/core/router/app_routes.dart';
import 'package:localink/core/theme/app_colors.dart';
import 'package:localink/core/widgets/app_buttons.dart';
import 'package:localink/core/widgets/app_text_field.dart';
import 'package:localink/core/widgets/onboarding_scaffold.dart';
import 'package:localink/onboarding/models/onboarding_models.dart';

/// NEW: Choose area manually. Reached from 1.8 (customer), and later from
/// 6.3 (provider) and 7.2 (shop owner). `args.nextRoute` says where to go next.
class ChooseAreaScreen extends StatefulWidget {
  const ChooseAreaScreen({super.key, this.args});
  final ChooseAreaArgs? args;

  @override
  State<ChooseAreaScreen> createState() => _ChooseAreaScreenState();
}

class _ChooseAreaScreenState extends State<ChooseAreaScreen> {
  // TODO(backend): load from your areas table / Places autocomplete instead.
  //   Supabase: from('areas').select().ilike('name', '%$query%')
  //   Firestore: query an `areas` collection
  // Sample data so the UI is visible:
  static const _sampleAreas = [
    'Kothrud',
    'Baner',
    'Hadapsar',
    'Viman Nagar',
    'Wakad',
    'Aundh',
  ];

  String? _selected;

  void _continue() {
    // TODO(backend): save the chosen area (name + lat/lng) to the profile.
    final next = widget.args?.nextRoute ?? AppRoutes.home;
    if (next == AppRoutes.home) {
      Navigator.of(context).pushNamedAndRemoveUntil(next, (route) => false);
    } else {
      Navigator.of(context).pushNamed(next);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: 'Choose your area',
      subtitle: 'Search or pick your locality.',
      actions: [
        PrimaryButton(
          label: 'Continue',
          onPressed: _selected == null ? null : _continue,
        ),
      ],
      child: Column(
        children: [
          const AppTextField(
            hint: 'Search area',
            icon: Icons.search_rounded,
            // TODO(backend): onChanged -> debounce -> query areas.
          ),
          const SizedBox(height: 14),
          for (final area in _sampleAreas) ...[
            _AreaTile(
              name: area,
              selected: _selected == area,
              onTap: () => setState(() => _selected = area),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _AreaTile extends StatelessWidget {
  const _AreaTile({
    required this.name,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(
          color: selected ? AppColors.teal : AppColors.line,
          width: selected ? 1.8 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.teal.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.place_outlined,
                    size: 18, color: AppColors.teal),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColors.ink,
                  ),
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded,
                    color: AppColors.teal, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
