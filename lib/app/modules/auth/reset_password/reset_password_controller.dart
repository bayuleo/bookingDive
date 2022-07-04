import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:get/get.dart';

class ResetPasswordController extends BaseController {
  @override
  void onReady() {
    super.onReady();
  }

  handleButtonReset() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
