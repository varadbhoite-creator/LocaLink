import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class BrowseShopsScreen extends StatelessWidget {
  const BrowseShopsScreen({super.key});

  final List<Map<String, String>> shops = const [
    {
      'name': 'Green Leaf Organics',
      'category': 'Grocery Store',
      'timing': 'Open • Closes 9 PM',
      'distance': '0.4 km',
    },
    {
      'name': 'Corner Bakehouse',
      'category': 'Bakery & Cafe',
      'timing': 'Open • Closes 8 PM',
      'distance': '1.1 km',
    },
    {
      'name': 'City Hardware Store',
      'category': 'Hardware & Tools',
      'timing': 'Closed • Opens 9 AM',
      'distance': '2.0 km',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Local Shops & Markets', style: TextStyle(color: AppColors.textPrimary, fontSize: 18)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: shops.length,
        itemBuilder: (context, index) {
          final shop = shops[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            color: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.border),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.storefront_rounded, color: Colors.blue, size: 28),
              ),
              title: Text(shop['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text('${shop['category']} • ${shop['distance']}'),
                  const SizedBox(height: 2),
                  Text(shop['timing']!, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                ],
              ),
              trailing: const Icon(Icons.chevron_right, color: AppColors.secondary),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}