import 'package:bookingdive/app/modules/profile/change_password/change_password_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(
      ChangePasswordController(),
    );
  }
}
