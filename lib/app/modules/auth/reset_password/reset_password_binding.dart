import 'package:bookingdive/app/modules/auth/reset_password/reset_password_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ResetPasswordController>(
      ResetPasswordController(),
    );
  }
}
