/// Route names. Numbers match the design file (e.g. 1.5 = Sign in or register).
class AppRoutes {
  AppRoutes._();

  // --- Onboarding (built) ---
  static const splash = '/'; // 1.1
  static const intro = '/intro'; // 1.2
  static const language = '/language'; // 1.3
  static const roleChoice = '/role-choice'; // 1.4
  static const auth = '/auth'; // 1.5
  static const terms = '/terms'; // NEW (consent)
  static const verifyPhone = '/verify-phone'; // 1.6
  static const customerInfo = '/customer-info'; // 1.7
  static const locationPermission = '/location-permission'; // 1.8
  static const chooseArea = '/choose-area'; // NEW

  // --- Next phases (placeholders for now) ---
  static const guestHome = '/guest-home'; // 2.1
  static const home = '/home'; // 2.2
  static const providerRegister = '/provider-register'; // 6.1
  static const shopRegister = '/shop-register'; // 7.1
  static const placeRegister = '/place-register'; // 7.5
}
