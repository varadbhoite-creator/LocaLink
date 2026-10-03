import 'package:flutter/material.dart';

import '../widgets/customer_widgets.dart';

class BrowseShopsScreen extends StatelessWidget {
  const BrowseShopsScreen({super.key});

  @override
  Widget build(BuildContext context) => const BrowseView(
        title: 'Shops',
        hint: 'Search product',
        kind: 'shop',
        items: ['Hardware', 'Electronics', 'Grocery', 'Stationers', 'Furniture', 'Medical'],
      );
}