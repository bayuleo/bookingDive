import 'package:bookingdive/app/modules/auth/forgot_password/forgot_password_binding.dart';
import 'package:bookingdive/app/modules/auth/forgot_password/forgot_password_screen.dart';
import 'package:bookingdive/app/modules/auth/forgot_password_check_email/forgot_password_check_email_binding.dart';
import 'package:bookingdive/app/modules/auth/forgot_password_check_email/forgot_password_check_email_screen.dart';
import 'package:bookingdive/app/modules/auth/register/register_binding.dart';
import 'package:bookingdive/app/modules/auth/register/register_screen.dart';
import 'package:bookingdive/app/modules/auth/reset_password/reset_password_binding.dart';
import 'package:bookingdive/app/modules/auth/reset_password/reset_password_screen.dart';
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
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_CHECK_EMAIL,
      page: () => const ForgotPasswordCheckEmailScreen(),
      binding: ForgotPasswordCheckEmailBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
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
