import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final a = ModalRoute.of(context)?.settings.arguments;
    final q = (a is String && a.trim().isNotEmpty) ? a.trim() : 'pipes';
    final nav = Navigator.of(context);

    return CustomerScaffold(
      navIndex: 0,
      children: [
        ScreenHeader(title: 'Results for $q'),
        const SizedBox(height: 10),
        ListCard(
          title: 'Sharma Hardware',
          subtitle: 'Sells $q · 450 m',
          color: AppColors.shops,
          onTap: () => nav.pushNamed(AppRoutes.shopDetail),
        ),
        ListCard(
          title: 'Patil Traders',
          subtitle: 'Sells $q · 900 m',
          color: AppColors.shops,
          onTap: () => nav.pushNamed(AppRoutes.shopDetail),
        ),
        const SizedBox(height: 12),
        const Text('Nothing found? Try AI',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: AppColors.muted)),
        const SizedBox(height: 10),
        GhostButton(
          label: 'Ask AI assistant',
          icon: Icons.auto_awesome,
          onPressed: () => CustomerSession.isGuest
              ? nav.pushNamed(AppRoutes.signUpGate)
              : comingSoon(context, 'AI Assistant'),
        ),
      ],
    );
  }
}