import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});
  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  @override
  void initState() {
    super.initState();
    CustomerSession.isGuest = true;
  }

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return CustomerScaffold(
      navIndex: 0,
      children: [
        const ScreenHeader(title: 'Explore LocaLink', showBack: false),
        const SizedBox(height: 10),
        AppSearchField(
          hint: 'Search places and shops',
          onSubmitted: (q) => nav.pushNamed(AppRoutes.searchResults, arguments: q),
        ),
        const SizedBox(height: 12),
        SosBanner(onTap: () => comingSoon(context, 'SOS')),
        const SizedBox(height: 14),
        CategoryGrid(
          items: const [
            CategoryItem('Services', Icons.handyman_outlined, AppColors.primary),
            CategoryItem('Places', Icons.place_outlined, AppColors.places),
            CategoryItem('Shops', Icons.storefront_outlined, AppColors.shops),
            CategoryItem('AI Assistant', Icons.auto_awesome, AppColors.primary),
          ],
          onTap: (label) {
            switch (label) {
              case 'Places':
                nav.pushNamed(AppRoutes.browsePlaces);
                break;
              case 'Shops':
                nav.pushNamed(AppRoutes.browseShops);
                break;
              default:
                nav.pushNamed(AppRoutes.signUpGate);
            }
          },
        ),
        const SizedBox(height: 14),
        const Text(
          'Services need an account. Places and Shops are open to everyone.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5, color: AppColors.muted),
        ),
        const SizedBox(height: 12),
        PrimaryButton(label: 'Sign up or log in', onPressed: () => nav.pushNamed(AppRoutes.signUpGate)),
      ],
    );
  }
}