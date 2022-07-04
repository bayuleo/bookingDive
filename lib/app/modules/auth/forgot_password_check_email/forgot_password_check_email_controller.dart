import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:get/get.dart';

class ForgotPasswordCheckEmailController extends BaseController {
  @override
  void onReady() {
    super.onReady();
  }

  handleClickButton() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }
}
