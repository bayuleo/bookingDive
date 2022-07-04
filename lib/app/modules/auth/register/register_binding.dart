import 'package:bookingdive/app/modules/auth/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(
      RegisterController(),
    );
  }
}
