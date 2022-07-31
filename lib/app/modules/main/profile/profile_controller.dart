import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/user_credentials_repository.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends BaseController {
  final AuthRepository _authRepository = Get.find();
  final UserCredentialsRepository _userCredentialsRepository = Get.find();

  ResponseProfileData? profileData;

  @override
  void onReady() {
    super.onReady();
    getDataUserFromLocal();
  }

  Future<void> getDataUserFromLocal() async {
    profileData = await _userCredentialsRepository.getCredentials().profile;
    update();
  }

  Future<void> handleButtonLogout() async {
    callDataService<ResponseAuthLogout>(
      () => _authRepository.signOut(),
      onSuccess: (res) {
        SnackbarHelper.success(
            title: 'Success', desc: 'You`re logout from application');
        Get.offAllNamed(Routes.LOGIN);
      },
    );
  }
}
