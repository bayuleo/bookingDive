import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/base_controller.dart';
import '../../routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onReady() {
    startAppHandler();
    super.onReady();
  }

  Future<void> startAppHandler() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.offAllNamed(Routes.LOGIN);
    // } else {
    // final credential = _userCredentialsRepository.getCredentials();
    // if (credential.isFirstLaunch) {
    // Get.offAllNamed(Routes.LOGIN);
    // } else {
    // Get.offAllNamed(Routes.LOGIN);
    // }
  }
}
