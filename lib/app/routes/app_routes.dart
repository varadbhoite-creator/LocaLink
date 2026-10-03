import 'package:flutter/material.dart';

import '../../features/customer/views/browse_places_screen.dart';
import '../../features/customer/views/browse_services_screen.dart';
import '../../features/customer/views/browse_shops_screen.dart';
import '../../features/customer/views/guest_home_screen.dart';
import '../../features/customer/views/home_screen.dart';
import '../../features/customer/views/listing_list_screen.dart';
import '../../features/customer/views/map_screen.dart';
import '../../features/customer/views/place_detail_screen.dart';
import '../../features/customer/views/provider_detail_screen.dart';
import '../../features/customer/views/report_wrong_info_screen.dart';
import '../../features/customer/views/reviews_list_screen.dart';
import '../../features/customer/views/saved_places_screen.dart';
import '../../features/customer/views/search_results_screen.dart';
import '../../features/customer/views/shop_detail_screen.dart';
import '../../features/customer/views/sign_up_gate_screen.dart';

class ListingArgs {
  final String title;
  final String kind; // 'service' | 'place' | 'shop'
  const ListingArgs(this.title, this.kind);
}

class AppRoutes {
  AppRoutes._();

  static const String guestHome = '/guest-home';
  static const String home = '/home';
  static const String signUpGate = '/sign-up-gate';
  static const String browseServices = '/browse-services';
  static const String browsePlaces = '/browse-places';
  static const String browseShops = '/browse-shops';
  static const String listingList = '/listing-list';
  static const String searchResults = '/search-results';
  static const String shopDetail = '/shop-detail';
  static const String placeDetail = '/place-detail';
  static const String providerDetail = '/provider-detail';
  static const String map = '/map';
  static const String reviewsList = '/reviews-list';
  static const String reportWrongInfo = '/report-wrong-info';
  static const String savedPlaces = '/saved-places';

  static final Map<String, WidgetBuilder> routes = {
    guestHome: (_) => const GuestHomeScreen(),
    home: (_) => const HomeScreen(),
    signUpGate: (_) => const SignUpGateScreen(),
    browseServices: (_) => const BrowseServicesScreen(),
    browsePlaces: (_) => const BrowsePlacesScreen(),
    browseShops: (_) => const BrowseShopsScreen(),
    listingList: (_) => const ListingListScreen(),
    searchResults: (_) => const SearchResultsScreen(),
    shopDetail: (_) => const ShopDetailScreen(),
    placeDetail: (_) => const PlaceDetailScreen(),
    providerDetail: (_) => const ProviderDetailScreen(),
    map: (_) => const MapScreen(),
    reviewsList: (_) => const ReviewsListScreen(),
    reportWrongInfo: (_) => const ReportWrongInfoScreen(),
    savedPlaces: (_) => const SavedPlacesScreen(),
  };
}