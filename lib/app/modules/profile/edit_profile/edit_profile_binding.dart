import 'package:bookingdive/app/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(
      EditProfileController(),
    );
  }
}
