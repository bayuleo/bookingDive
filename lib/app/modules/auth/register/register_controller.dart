import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model/user_credentials.dart';
import '../../../core/utils/app_focus.dart';
import '../../../core/utils/snackbar.dart';
import '../../../core/utils/validator.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/user_credentials_repository.dart';

class RegisterController extends BaseController {
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  final AuthRepository _authRepository = Get.find();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isEnabledRegisterButton = false;
  bool isShownPassword = false;
  bool isShownConfirmPassword = false;

  @override
  void onReady() {
    super.onReady();
  }

  handleButtonRegister() {
    AppFocus.unfocus(Get.context!);
    _handleRegisterAPI();
  }

  handleClickShowPassword() {
    isShownPassword = !isShownPassword;
    update();
  }

  handleClickShowConfirmPassword() {
    isShownConfirmPassword = !isShownConfirmPassword;
    update();
  }

  handleButtonBackToLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> _handleRegisterAPI() async {
    await callDataService<ResponseRegister>(
      () => _authRepository.signUp(
        RequestRegister(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      ),
      onSuccess: ((response) async {
        await _userCredentialsRepository.updateCredentials(
          UserCredentials(
            accessToken: response.data.accessToken,
            refreshToken: response.data.refreshToken,
            profile: null,
          ),
        );
        Get.offAllNamed(Routes.MAIN_CONTENT);
        SnackbarHelper.success(
          title: "Welcome to Booking Dive",
          desc: "Your data success registered in our system.",
        );
      }),
    );
  }

  onChangedText(value) {
    if (ValidatorHelper.validateCommon(firstNameController.text.trim()) ==
            ValidatorResult.valid &&
        ValidatorHelper.validateCommon(lastNameController.text.trim()) ==
            ValidatorResult.valid &&
        ValidatorHelper.validateCommon(emailController.text.trim()) ==
            ValidatorResult.valid &&
        TextFieldValidatorHelper.validatePassword(
                passwordController.text.trim()) ==
            null &&
        TextFieldValidatorHelper.validateConfirmPassword(
                passwordController.text.trim(),
                confirmPasswordController.text.trim()) ==
            null) {
      isEnabledRegisterButton = true;
    } else {
      isEnabledRegisterButton = false;
    }
    update();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
