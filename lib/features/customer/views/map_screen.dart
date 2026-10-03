import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Map View', style: TextStyle(color: AppColors.textPrimary, fontSize: 18)),
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Stack(
        children: [
          // Simulated Map Canvas
          Container(
            color: Colors.blueGrey.shade50,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.map_outlined, size: 80, color: AppColors.secondary),
                  SizedBox(height: 12),
                  Text(
                    'Interactive Map View',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                  ),
                  Text(
                    '(Integrates with Google Maps / Mapbox later)',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),

          // Floating Filter Pills on Top
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildMapFilter('All Pins', true),
                  _buildMapFilter('Shops', false),
                  _buildMapFilter('Services', false),
                  _buildMapFilter('Places', false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapFilter(String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: active ? AppColors.primary : AppColors.surface,
          foregroundColor: active ? Colors.white : AppColors.textPrimary,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}