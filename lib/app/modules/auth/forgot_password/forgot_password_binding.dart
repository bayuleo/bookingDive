import 'package:bookingdive/app/modules/auth/forgot_password/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
    );
  }
}
