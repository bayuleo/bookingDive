import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class FormEditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FormEditProfileController>(
      FormEditProfileController(),
    );
  }
}
