import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../widgets/customer_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    CustomerSession.isGuest = false;
  }

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return CustomerScaffold(
      navIndex: 0,
      children: [
        ScreenHeader(
          title: 'LocaLink',
          showBack: false,
          trailing: RoundIconButton(
              icon: Icons.bookmark_border, onTap: () => nav.pushNamed(AppRoutes.savedPlaces)),
        ),
        const SizedBox(height: 10),
        AppSearchField(
          hint: 'Search or ask AI',
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
              case 'Services':
                nav.pushNamed(AppRoutes.browseServices);
                break;
              case 'Places':
                nav.pushNamed(AppRoutes.browsePlaces);
                break;
              case 'Shops':
                nav.pushNamed(AppRoutes.browseShops);
                break;
              default:
                comingSoon(context, 'AI Assistant');
            }
          },
        ),
        const SizedBox(height: 14),
        ListCard(
          title: 'New to City planner',
          subtitle: 'Get a 14 day settling-in checklist',
          icon: Icons.checklist_rounded,
          onTap: () => comingSoon(context, 'New to City planner'),
        ),
        const SectionLabel('Nearby now'),
        ListCard(
          title: 'Sharma Hardware',
          subtitle: '450 m · Open now',
          color: AppColors.shops,
          onTap: () => nav.pushNamed(AppRoutes.shopDetail),
        ),
        ListCard(
          title: 'City Hospital',
          subtitle: '600 m · Open 24x7',
          color: AppColors.places,
          onTap: () => nav.pushNamed(AppRoutes.placeDetail),
        ),
      ],
    );
  }
}