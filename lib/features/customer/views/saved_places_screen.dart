import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class SavedPlacesScreen extends StatelessWidget {
  const SavedPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return CustomerScaffold(
      navIndex: 4,
      children: [
        const ScreenHeader(title: 'Saved'),
        const SizedBox(height: 10),
        ListCard(
            title: 'City Hospital',
            subtitle: 'Place · 600 m',
            color: AppColors.places,
            onTap: () => nav.pushNamed(AppRoutes.placeDetail)),
        ListCard(
            title: 'Sharma Hardware',
            subtitle: 'Shop · 450 m',
            color: AppColors.shops,
            onTap: () => nav.pushNamed(AppRoutes.shopDetail)),
        ListCard(
            title: 'Ravi Plumbing',
            subtitle: 'Service · 1 km',
            color: AppColors.primary,
            onTap: () => nav.pushNamed(AppRoutes.providerDetail)),
      ],
    );
  }
}