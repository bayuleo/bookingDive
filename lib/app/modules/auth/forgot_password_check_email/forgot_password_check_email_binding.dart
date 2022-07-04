import 'package:bookingdive/app/modules/auth/forgot_password_check_email/forgot_password_check_email_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordCheckEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordCheckEmailController>(
      ForgotPasswordCheckEmailController(),
    );
  }
}
