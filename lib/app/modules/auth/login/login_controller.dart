import 'package:bookingdive/app/core/configs/firebase_config.dart';
import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/auth_repository.dart';
import 'package:bookingdive/app/data/repository/user_credentials_repository.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/utils/app_focus.dart';
import '../../../core/utils/validator.dart';

class LoginController extends BaseController {
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  final AuthRepository _authRepository = Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isEnabledLoginButton = false;
  bool isShownPassword = false;
  bool isNewAccount = false;
  bool isRememberMe = false;

  String? email;
  String? token;
  String? refreshToken;

  @override
  void onReady() async {
    var credential = await _userCredentialsRepository.getCredentials();
    email = credential.email;
    token = credential.accessToken;
    refreshToken = credential.refreshToken;
    update();
    super.onReady();
  }

  Future<void> handleRegistrationStep() async {}

  Future<void> _handleLoginAPI() async {
    await callDataService<ResponseAuthSignIn>(
      () => _authRepository.signIn(
        RequestAuthSignIn(
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      ),
      onSuccess: ((response) async {
        await _userCredentialsRepository.updateCredentials(
          UserCredentials(
            // isFirstLaunch: false,
            accessToken: response.data.token,
            refreshToken: response.data.refreshToken,
            email: emailController.text.trim(),
          ),
        );
        Get.find<DioConfigure>().updateToken();
        Get.offAllNamed(Routes.MAIN_CONTENT);
      }),
    );
  }

  Future<void> handleLoginGoogle() async {
    var response = await FirebaseConfig.signInWithGoogle();
    await _userCredentialsRepository.updateCredentials(
      UserCredentials(
        accessToken: response.credential?.token.toString(),
        refreshToken: '',
        email: response.user?.email,
      ),
    );
    Get.offAllNamed(Routes.MAIN_CONTENT);
  }

  Future<void> handleLoginFB() async {
    var response = await FirebaseConfig.signInWithFacebook();
    await _userCredentialsRepository.updateCredentials(
      UserCredentials(
        accessToken: response.credential?.token.toString(),
        refreshToken: '',
        email: response.user?.email,
      ),
    );
    Get.offAllNamed(Routes.MAIN_CONTENT);
  }

  // handleClickRememberMe() {
  //   this.isRememberMe = !this.isRememberMe;
  //   update();
  // }

  handleCLickForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  handleClickLogin() {
    AppFocus.unfocus(Get.context!);
    _handleLoginAPI();
  }

  handleClickRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  handleClickShowPassword() {
    isShownPassword = !isShownPassword;
    update();
  }

  onChangedText(value) {
    if (ValidatorHelper.validateCommon(emailController.text.trim()) ==
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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
