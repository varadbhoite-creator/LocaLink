import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class ListingListScreen extends StatelessWidget {
  const ListingListScreen({super.key});

  static const Map<String, List<List<String>>> _data = {
    'shop': [
      ['Sharma Hardware', '450 m · Open now'],
      ['Patil Traders', '900 m · Open now'],
      ['City Tools', '1.4 km · 24x7'],
    ],
    'place': [
      ['City Hospital', '600 m · Open 24x7'],
      ['Rural Care Clinic', '1.1 km · Open now'],
      ['Lifeline Diagnostics', '1.8 km · Open now'],
    ],
    'service': [
      ['Ravi Plumbing', '1 km · Verified'],
      ['Gupta Works', '2 km · Verified'],
      ['Shinde Services', '2.6 km · Available'],
    ],
  };

  @override
  Widget build(BuildContext context) {
    final a = ModalRoute.of(context)?.settings.arguments;
    final args = a is ListingArgs ? a : const ListingArgs('Hardware near me', 'shop');
    final color = kindColor(args.kind);
    final rows = _data[args.kind] ?? _data['shop']!;
    final nav = Navigator.of(context);

    return CustomerScaffold(
      navIndex: 0,
      children: [
        ScreenHeader(
          title: args.title,
          trailing: RoundIconButton(icon: Icons.map_outlined, onTap: () => nav.pushNamed(AppRoutes.map)),
        ),
        const SizedBox(height: 10),
        AppSearchField(
          hint: args.kind == 'shop' ? 'Search product' : 'Search',
          onSubmitted: (q) => nav.pushNamed(AppRoutes.searchResults, arguments: q),
        ),
        const SizedBox(height: 10),
        const Text('Sorted by distance, verified first',
            style: TextStyle(fontSize: 12.5, color: AppColors.muted)),
        const SizedBox(height: 10),
        for (final r in rows)
          ListCard(
            title: r[0],
            subtitle: r[1],
            color: color,
            onTap: () => nav.pushNamed(detailRoute(args.kind)),
          ),
      ],
    );
  }
}