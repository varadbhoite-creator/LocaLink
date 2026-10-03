import 'package:flutter/material.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_colors.dart';

void main() {
  runApp(const LocaLinkApp());
}

class LocaLinkApp extends StatelessWidget {
  const LocaLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocaLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
      // Starts on the Home Screen
      initialRoute: AppRoutes.home,
      // Registers all routes defined in AppRoutes
      routes: AppRoutes.routes,
    );
  }
}