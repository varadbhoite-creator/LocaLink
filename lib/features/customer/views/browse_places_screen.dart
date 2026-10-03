import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class BrowsePlacesScreen extends StatelessWidget {
  const BrowsePlacesScreen({super.key});

  final List<Map<String, String>> places = const [
    {
      'name': 'Central City Park',
      'type': 'Park & Recreation',
      'distance': '0.5 km away',
      'rating': '4.9 ★',
    },
    {
      'name': 'Heritage Town Library',
      'type': 'Public Library',
      'distance': '1.8 km away',
      'rating': '4.7 ★',
    },
    {
      'name': 'Community Sports Complex',
      'type': 'Sports Arena',
      'distance': '2.2 km away',
      'rating': '4.5 ★',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Local Places', style: TextStyle(color: AppColors.textPrimary, fontSize: 18)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
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
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.park_rounded, color: Colors.green, size: 28),
              ),
              title: Text(place['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              subtitle: Text('${place['type']} • ${place['distance']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(place['rating']!, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                  const SizedBox(width: 4),
                  const Icon(Icons.chevron_right, color: AppColors.secondary),
                ],
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}