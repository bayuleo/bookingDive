import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/auth_repository.dart';
import 'package:bookingdive/app/data/repository/user_credentials_repository.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/base/base_controller.dart';
import '../../core/utils/app_focus.dart';
import '../../core/utils/validator.dart';

class LoginController extends BaseController {
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  final AuthRepository _authRepository = Get.find();

  bool isEnabledLoginButton = false;
  bool isShownPassword = false;
  bool isNewAccount = false;

  @override
  void onReady() {
    super.onReady();
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    AppFocus.unfocus(Get.context!);
    _handleLogin();
    print('login');
  }

  void handleForgotPassword() {}

  Future<void> handleRegistrationStep() async {}

  Future<void> _handleLogin() async {
    await callDataService<ResponseAuthSignIn>(
      () => _authRepository.signIn(
        RequestAuthSignIn(
            username: usernameController.text.trim(),
            password: usernameController.text.trim(),
            rememberMe: true), // TODO update handle rememberMe
      ),
      onSuccess: ((response) async {
        await _userCredentialsRepository.updateCredentials(
          UserCredentials(
            isFirstLaunch: false,
            accessToken: response.data.token,
            refreshToken: response.data.refreshToken,
            username: usernameController.text.trim(),
          ),
        );
        Get.find<DioConfigure>().updateToken();
        Get.offAllNamed(Routes.MAIN_CONTENT);
      }),
    );
  }

  Future<void> _handleLoginGoogle() async {}

  Future<void> _handleLoginFB() async {}

  onChangedText(value) {
    if (ValidatorHelper.validateCommon(usernameController.text.trim()) ==
            ValidatorResult.valid &&
        ValidatorHelper.validatePassword(passwordController.text.trim()) ==
            ValidatorResult.valid) {
      isEnabledLoginButton = true;
    } else {
      isEnabledLoginButton = false;
    }
    update();
  }

  onTapShowPassword() {
    isShownPassword = !isShownPassword;
    update();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
