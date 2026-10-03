import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const c = AppColors.places;
    final nav = Navigator.of(context);
    return CustomerScaffold(
      navIndex: 0,
      children: [
        const ScreenHeader(title: 'City Hospital', trailing: SaveButton()),
        const SizedBox(height: 10),
        const PhotoPlaceholder(color: c, icon: Icons.local_hospital_outlined),
        const SizedBox(height: 14),
        const InfoRow(icon: Icons.emergency_outlined, text: 'Emergency 24x7 / Ambulance', color: AppColors.sos),
        const InfoRow(icon: Icons.place_outlined, text: 'Station Road, Kolhapur'),
        const InfoRow(icon: Icons.schedule, text: 'OPD 9 am to 8 pm · Emergency always open'),
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