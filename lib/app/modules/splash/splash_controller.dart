import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/base_controller.dart';
import '../../data/repository/user_credentials_repository.dart';
import '../../routes/app_routes.dart';

class SplashController extends BaseController {
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  @override
  void onReady() {
    startAppHandler();
    super.onReady();
  }

  Future<void> startAppHandler() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    final credential = _userCredentialsRepository.getCredentials();
    if (credential.accessToken != null) {
      Get.offAllNamed(Routes.MAIN_CONTENT);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
