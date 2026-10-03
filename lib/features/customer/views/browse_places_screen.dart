import 'package:flutter/material.dart';

import '../widgets/customer_widgets.dart';

class BrowsePlacesScreen extends StatelessWidget {
  const BrowsePlacesScreen({super.key});

  @override
  Widget build(BuildContext context) => const BrowseView(
        title: 'Places',
        hint: 'Search place',
        kind: 'place',
        items: ['Hospital', 'College', 'Coaching', 'PG Hostel', 'Govt office', 'Bank ATM'],
      );
}