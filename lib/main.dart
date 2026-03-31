import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/splash/splash_screen.dart';
import 'pages/onboarding/onboarding.dart';
import 'pages/home/home_screen.dart';
import 'pages/auth/login.dart';
import 'pages/profile/map_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'pages/auth/sign_up.dart';
import 'pages/auth/forget_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/catalog/catalog_screen.dart';
import 'pages/catalog/product_details.dart';
import 'pages/scan/scan_screen.dart';
import 'pages/profile/profile_screen.dart';
import 'pages/earning/earning_screen.dart';
import 'pages/recycle/recycle_screen.dart';
import 'pages/search_screen.dart';
import 'pages/profile/personal_information_screen.dart';
import 'pages/profile/password_and_security_screen.dart';
import 'pages/profile/notification_preferences_screen.dart';
import 'pages/profile/location_screen.dart';
import 'pages/profile/faq_screen.dart';
import 'pages/profile/help_center_screen.dart';
import 'pages/profile/referral_screen.dart';
import 'pages/learn_and_earn/learn_and_earn_screen.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Waste Grid',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        getPages: AppPages.pages,
      ),
    );
  }
}

class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const login = '/login';
  static const map = '/map';
  static const learn_and_earn_screen = '/learn_and_earn';
  static const signIn = '/sign_in';
  static const signUp = '/sign_up';
  static const forgetPassword = '/forget_password';
  static const catalog = '/catalog';
  static const productDetails = '/product_details';
  static const profile = '/profile';
  static const earning = '/earning';
  static const recycle = '/recycle';
  static const search = '/search';
  static const personalInformation = '/personal_information';
  static const passwordAndSecurity = '/password_and_security';
  static const notificationPreferences = '/notification_preferences';
  static const location = '/location';
  static const scan = '/scan';
  static const faq = '/faq';
  static const helpCenter = '/help_center';
  static const referral = '/referral';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),

    GetPage(
      name: Routes.learn_and_earn_screen,
      page: () => LearnAndEarnScreen(),
    ),

    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.signUp, page: () => SignUpScreen()),
    GetPage(name: Routes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: Routes.map, page: () => MapScreen()),

    GetPage(name: Routes.catalog, page: () => CatalogScreen()),
    GetPage(name: Routes.productDetails, page: () => ProductDetailsScreen()),
    GetPage(name: Routes.profile, page: () => ProfileScreen()),
    GetPage(name: Routes.earning, page: () => EarningScreen()),
    GetPage(name: Routes.recycle, page: () => RecycleScreen()),
    GetPage(name: Routes.scan, page: () => ScanScreen()),
    GetPage(name: Routes.search, page: () => SearchScreen()),
    GetPage(
      name: Routes.personalInformation,
      page: () => PersonalInformationScreen(),
    ),
    GetPage(
      name: Routes.passwordAndSecurity,
      page: () => PasswordAndSecurityScreen(),
    ),
    GetPage(
      name: Routes.notificationPreferences,
      page: () => NotificationPreferencesScreen(),
    ),
    GetPage(name: Routes.location, page: () => LocationScreen()),
    GetPage(name: Routes.faq, page: () => FaqScreen()),
    GetPage(name: Routes.helpCenter, page: () => HelpCenterScreen()),
    GetPage(name: Routes.referral, page: () => ReferralScreen()),
  ];
}
