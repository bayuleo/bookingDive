import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/modules/main/main_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/user_credentials_repository.dart';

class ProfileController extends BaseController {
  final AuthRepository _authRepository = Get.find();
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  final MainController _mainController = Get.find();

  UserCredentials? userCredentials;
  ResponseProfileData? profileData;

  @override
  void onReady() {
    super.onReady();
    getDataUserFromLocal();
  }

  void onTapMyBooking() {
    _mainController.onPressedNavBarItem(1);
  }

  Future<void> getDataUserFromLocal() async {
    userCredentials = await _userCredentialsRepository.getCredentials();
    profileData = userCredentials?.profile;
    update();
  }

  Future<void> handleButtonLogout() async {
    callDataService<ResponseAuthLogout>(
      () => _authRepository.signOut(),
      onSuccess: (res) {
        Get.back();
        SnackbarHelper.success(
            title: 'Success', desc: 'You`re logout from application');
        // Get.offAllNamed(Routes.MAIN_CONTENT);
        _mainController.onPressedNavBarItem(0);
        getDataUserFromLocal();
      },
    );
  }
}
