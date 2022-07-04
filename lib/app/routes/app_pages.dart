import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_screen.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_screen.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.MAIN_CONTENT,
      page: () => const MainScreen(),
      binding: MainBinding(),
      children: [
        // GetPage(
        //   name: Routes.MENU1,
        //   page: () => const DashboardScreen(),
        // ),
        // GetPage(
        //   name: Routes.MENU2,
        //   page: () => const DashboardScreen(),
        // ),
        // GetPage(
        //   name: Routes.MENU3,
        //   page: () => const DashboardScreen(),
        // ),
        // GetPage(
        //   name: Routes.MENU4,
        //   page: () => const DashboardScreen(),
        // ),
        // GetPage(
        //   name: Routes.MENU5,
        //   page: () => const DashboardScreen(),
        // ),
      ],
    ),
  ];
}
