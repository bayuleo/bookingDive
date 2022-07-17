import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/model/form_edit_argument.dart';

class FormEditProfileController extends BaseController {
  FormEditArgument? initData;

  @override
  void onReady() {
    super.onReady();
    initData = Get.arguments;
    update();
  }
}
