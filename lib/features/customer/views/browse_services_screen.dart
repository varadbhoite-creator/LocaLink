import 'package:flutter/material.dart';

import '../widgets/customer_widgets.dart';

class BrowseServicesScreen extends StatelessWidget {
  const BrowseServicesScreen({super.key});

  @override
  Widget build(BuildContext context) => const BrowseView(
        title: 'Services',
        hint: 'Search service',
        kind: 'service',
        items: ['Electrician', 'Plumber', 'Carpenter', 'Cleaning', 'Locksmith', 'Movers'],
      );
}