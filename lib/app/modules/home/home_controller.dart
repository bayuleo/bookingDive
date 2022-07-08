import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/repository/auth_repository.dart';
import '../../data/repository/user_credentials_repository.dart';
import '../../routes/app_routes.dart';

class HomeController extends BaseController {
  final AuthRepository _authRepository = Get.find();
  final UserCredentialsRepository _userCredentialsRepository = Get.find();

  String? email;
  String? token;
  String? refreshToken;

  var pageIndex = 0;

  @override
  void onReady() async {
    var credential = await _userCredentialsRepository.getCredentials();
    email = credential.email;
    token = credential.accessToken;
    refreshToken = credential.refreshToken;
    update();
    super.onReady();
  }

  @override
  void onClode() async {
    super.onClose();
  }

  Future<void> handleButtonLogout() async {
    var res = await _authRepository.signOut();
    if (res) Get.offAllNamed(Routes.LOGIN);
  }
}
