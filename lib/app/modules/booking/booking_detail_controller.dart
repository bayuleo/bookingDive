import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/data/repository/user_credentials_repository.dart';
import 'package:bookingdive/app/modules/main/profile/profile_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailController extends BaseController {
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  final ProfileController _profileController = Get.find();

  UserCredentials? userCredentials;

  bool isUseLoginInformation = false;

  List<TextEditingController> controllers = [];

  BookingArguments? data;

  @override
  void onReady() {
    data = Get.arguments;
    getUserData();
    super.onReady();
  }

  Future<void> getUserData() async {
    userCredentials = await _userCredentialsRepository.getCredentials();
    update();
  }

  goToLogin() async {
    await Get.toNamed(Routes.LOGIN);
    _profileController.getDataUserFromLocal();
    getUserData();
    update();
  }

  goToRegister() async {
    await Get.toNamed(Routes.REGISTER);
    _profileController.getDataUserFromLocal();
    getUserData();
    update();
  }

  onChangeIsUseLoginInformation() {
    isUseLoginInformation = !isUseLoginInformation;
    update();
  }
}
