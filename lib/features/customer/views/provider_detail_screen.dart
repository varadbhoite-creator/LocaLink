import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class ProviderDetailScreen extends StatelessWidget {
  const ProviderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const c = AppColors.primary;
    final nav = Navigator.of(context);
    return CustomerScaffold(
      navIndex: 0,
      children: [
        const ScreenHeader(title: 'Ravi Plumbing', trailing: SaveButton()),
        const SizedBox(height: 10),
        const PhotoPlaceholder(color: c, icon: Icons.plumbing),
        const SizedBox(height: 14),
        const RatingRow(rating: 4.6, label: '4.6 from 38 reviews'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: tint(c, .08), borderRadius: BorderRadius.circular(14)),
          child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.auto_awesome, color: c, size: 20),
            SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('AI summary: on time, fair price',
                    style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: AppColors.ink)),
                SizedBox(height: 2),
                Text('AI suggestion, please check',
                    style: TextStyle(fontSize: 11.5, color: AppColors.muted)),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 12),
        const ChipRow(labels: ['Verified', 'Hindi', 'Marathi'], selected: 0, color: c),
        const SizedBox(height: 16),
        PrimaryButton(
          label: 'Request this service',
          onPressed: () => CustomerSession.isGuest
              ? nav.pushNamed(AppRoutes.signUpGate)
              : comingSoon(context, 'Service request'),
        ),
        const SizedBox(height: 10),
        GhostButton(label: 'Read reviews', onPressed: () => nav.pushNamed(AppRoutes.reviewsList)),
      ],
    );
  }
}