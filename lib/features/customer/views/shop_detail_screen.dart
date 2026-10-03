import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const c = AppColors.shops;
    final nav = Navigator.of(context);
    return CustomerScaffold(
      navIndex: 0,
      children: [
        const ScreenHeader(title: 'Sharma Hardware', trailing: SaveButton()),
        const SizedBox(height: 10),
        const PhotoPlaceholder(color: c, icon: Icons.storefront_outlined),
        const SizedBox(height: 14),
        const ChipRow(labels: ['Pipes and fittings', 'Paint', 'Tools'], selected: 0, color: c),
        const SizedBox(height: 12),
        const InfoRow(icon: Icons.schedule, text: 'Open until 9 pm', color: AppColors.open),
        const InfoRow(icon: Icons.place_outlined, text: 'Market Road, near bus stand · 450 m'),
        const SizedBox(height: 14),
        PrimaryButton(label: 'Call', icon: Icons.call, color: c, onPressed: () => comingSoon(context, 'Calling')),
        const SizedBox(height: 10),
        GhostButton(
            label: 'Directions',
            icon: Icons.directions_outlined,
            color: c,
            onPressed: () => nav.pushNamed(AppRoutes.map)),
        const SizedBox(height: 10),
        GhostButton(
            label: 'Report wrong info',
            icon: Icons.flag_outlined,
            color: c,
            onPressed: () => nav.pushNamed(AppRoutes.reportWrongInfo)),
      ],
    );
  }
}