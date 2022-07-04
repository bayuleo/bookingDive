import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  @override
  void onReady() {
    super.onReady();
  }

  handleSubmitResetPasswordButton() {
    Get.toNamed(Routes.FORGOT_PASSWORD_CHECK_EMAIL);
  }
}
