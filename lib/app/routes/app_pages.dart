import 'package:bookingdive/app/modules/auth/forgot_password/forgot_password_binding.dart';
import 'package:bookingdive/app/modules/auth/forgot_password/forgot_password_screen.dart';
import 'package:bookingdive/app/modules/auth/forgot_password_check_email/forgot_password_check_email_binding.dart';
import 'package:bookingdive/app/modules/auth/forgot_password_check_email/forgot_password_check_email_screen.dart';
import 'package:bookingdive/app/modules/auth/register/register_binding.dart';
import 'package:bookingdive/app/modules/auth/register/register_screen.dart';
import 'package:bookingdive/app/modules/auth/reset_password/reset_password_binding.dart';
import 'package:bookingdive/app/modules/auth/reset_password/reset_password_screen.dart';
import 'package:bookingdive/app/modules/booking/booking_detail_binding.dart';
import 'package:bookingdive/app/modules/booking/booking_detail_screen.dart';
import 'package:bookingdive/app/modules/location/location_binding.dart';
import 'package:bookingdive/app/modules/location/location_view.dart';
import 'package:bookingdive/app/modules/location/review/review_binding.dart';
import 'package:bookingdive/app/modules/location/review/review_screen.dart';
import 'package:bookingdive/app/modules/payment/success/payment_success_binding.dart';
import 'package:bookingdive/app/modules/payment/success/payment_success_screen.dart';
import 'package:bookingdive/app/modules/payment/waiting/payment_waiting_binding.dart';
import 'package:bookingdive/app/modules/payment/waiting/payment_waiting_screen.dart';
import 'package:bookingdive/app/modules/profile/change_password/change_password_binding.dart';
import 'package:bookingdive/app/modules/profile/change_password/change_password_screen.dart';
import 'package:bookingdive/app/modules/profile/edit_profile/edit_profile_binding.dart';
import 'package:bookingdive/app/modules/profile/edit_profile/edit_profile_screen.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_binding.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_screen.dart';
import 'package:bookingdive/app/modules/profile/payment/list_payment_method/list_payment_method_binding.dart';
import 'package:bookingdive/app/modules/profile/payment/list_payment_method/list_payment_method_screen.dart';
import 'package:bookingdive/app/modules/search/search_binding.dart';
import 'package:bookingdive/app/modules/search/search_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_screen.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_screen.dart';
import '../modules/profile/payment/add_payment_method/add_payment_method_binding.dart';
import '../modules/profile/payment/add_payment_method/add_payment_method_screen.dart';
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
      name: Routes.SEARCH,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.LIST_PAYMENT_METHOD,
      page: () => const ListPaymentMethodScreen(),
      binding: ListPaymentMethodBinding(),
    ),
    GetPage(
      name: Routes.ADD_PAYMENT_METHOD,
      page: () => const AddPaymentMethodScreen(),
      binding: AddPaymentMethodBinding(),
    ),
    GetPage(
      name: Routes.FORM_EDIT_PROFILE,
      page: () => const FormEditProfileScreen(),
      binding: FormEditProfileBinding(),
    ),
    GetPage(
      name: Routes.LOCATION,
      page: () => LocationScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: Routes.REVIEW,
      page: () => ReviewScreen(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: Routes.BOOKING,
      page: () => BookingDetailScreen(),
      binding: BookingDetailBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT_WAITING,
      page: () => PaymentWaitingScreen(),
      binding: PaymentWaitingBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT_SUCCESS,
      page: () => PaymentSuccessScreen(),
      binding: PaymentSuccessBinding(),
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
