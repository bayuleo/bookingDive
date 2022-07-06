import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/validator.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_focus.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/user_credentials_repository.dart';

class ForgotPasswordController extends BaseController {
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  final AuthRepository _authRepository = Get.find();

  final emailController = TextEditingController();
  bool isEnableButton = false;

  @override
  void onReady() {
    super.onReady();
  }

  handleSubmitResetPasswordButton() {
    AppFocus.unfocus(Get.context!);
    _handleResetPasswordAPI();
  }

  Future<void> _handleResetPasswordAPI() async {
    await callDataService<ResponseForgotPassword>(
      () => _authRepository.forgotPassword(
        RequestForgotPassword(
          email: emailController.text.trim(),
        ),
      ),
      onSuccess: ((response) {
        Get.toNamed(Routes.FORGOT_PASSWORD_CHECK_EMAIL);
      }),
    );
  }

  onChangedText(value) {
    TextFieldValidatorHelper.validateEmail(emailController.text.trim()) == null
        ? isEnableButton = true
        : isEnableButton = false;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
