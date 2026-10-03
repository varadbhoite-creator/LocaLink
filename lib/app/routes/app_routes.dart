import 'package:flutter/material.dart';

// Import all Phase 2 views
import '../../features/customer/views/guest_home_screen.dart';
import '../../features/customer/views/home_screen.dart';
import '../../features/customer/views/sign_up_gate_screen.dart';
import '../../features/customer/views/browse_services_screen.dart';
import '../../features/customer/views/browse_places_screen.dart';
import '../../features/customer/views/browse_shops_screen.dart';
import '../../features/customer/views/search_results_screen.dart';
import '../../features/customer/views/saved_places_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String guestHome = '/guest-home';
  static const String home = '/home';
  static const String signUpGate = '/sign-up-gate';
  static const String browseServices = '/browse-services';
  static const String browsePlaces = '/browse-places';
  static const String browseShops = '/browse-shops';
  static const String searchResults = '/search-results';
  static const String savedPlaces = '/saved-places';

  static Map<String, WidgetBuilder> get routes => {
        guestHome: (context) => const GuestHomeScreen(),
        home: (context) => const HomeScreen(),
        signUpGate: (context) => const SignUpGateScreen(),
        browseServices: (context) => const BrowseServicesScreen(),
        browsePlaces: (context) => const BrowsePlacesScreen(),
        browseShops: (context) => const BrowseShopsScreen(),
        searchResults: (context) => const SearchResultsScreen(),
        savedPlaces: (context) => const SavedPlacesScreen(),
      };
}