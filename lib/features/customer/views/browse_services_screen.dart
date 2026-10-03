import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';

class BrowseServicesScreen extends StatelessWidget {
  const BrowseServicesScreen({super.key});

  final List<Map<String, String>> services = const [
    {
      'title': 'Apex Electrical Services',
      'category': 'Electrician',
      'rating': '4.8 ★ (120 reviews)',
      'distance': '1.2 km away',
    },
    {
      'title': 'Metro Plumbing Solutions',
      'category': 'Plumber',
      'rating': '4.6 ★ (85 reviews)',
      'distance': '2.5 km away',
    },
    {
      'title': 'Urban Woodwork & Repairs',
      'category': 'Carpenter',
      'rating': '4.9 ★ (42 reviews)',
      'distance': '0.8 km away',
    },
    {
      'title': 'ProClean Home Wash',
      'category': 'Cleaning',
      'rating': '4.7 ★ (210 reviews)',
      'distance': '3.1 km away',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Local Services', style: TextStyle(color: AppColors.textPrimary, fontSize: 18)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Column(
        children: [
          // Filter Chips Row
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('All Services', isSelected: true),
                _buildFilterChip('Electricians'),
                _buildFilterChip('Plumbers'),
                _buildFilterChip('Carpenters'),
                _buildFilterChip('Cleaning'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          
          // Services List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final item = services[index];
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
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.build_circle_rounded, color: AppColors.primary, size: 28),
                    ),
                    title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('${item['category']} • ${item['distance']}', style: const TextStyle(fontSize: 12)),
                        const SizedBox(height: 2),
                        Text(item['rating']!, style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right, color: AppColors.secondary),
                    onTap: () {
                      // Static UI navigation to provider detail placeholder
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selected: ${item['title']}')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? AppColors.primary : AppColors.surface,
        side: BorderSide(color: isSelected ? AppColors.primary : AppColors.border),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }
}