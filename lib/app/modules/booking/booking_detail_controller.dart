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

  List<TextEditingController> firstNameControllers = [];
  List<TextEditingController> lastNameControllers = [];
  List<TextEditingController> phoneNumberControllers = [];
  List<TextEditingController> certificateNumberControllers = [];

  BookingArguments? data;

  @override
  void onReady() async {
    data = await Get.arguments;
    generateController();
    getUserData();
    super.onReady();
  }

  void generateController() {
    for (int i = 0; i < int.parse(data?.package?.minimumDiver ?? '1'); i++) {
      var firstName = TextEditingController();
      var lastName = TextEditingController();
      var phoneNumber = TextEditingController();
      var certificateNumber = TextEditingController();

      firstNameControllers.add(firstName);
      lastNameControllers.add(lastName);
      phoneNumberControllers.add(phoneNumber);
      certificateNumberControllers.add(certificateNumber);
    }
  }

  @override
  void onClose() {
    for (int i = 0; i < int.parse(data?.package?.minimumDiver ?? '1'); i++) {
      firstNameControllers[i].dispose();
      lastNameControllers[i].dispose();
      phoneNumberControllers[i].dispose();
      certificateNumberControllers[i].dispose();
    }
    super.onClose();
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
    if (isUseLoginInformation) {
      firstNameControllers[0].text = userCredentials?.profile?.firstName ?? '';
      lastNameControllers[0].text = userCredentials?.profile?.lastName ?? '';
      phoneNumberControllers[0].text =
          userCredentials?.profile?.phoneNumber ?? '';
    } else {
      firstNameControllers[0].text = '';
      lastNameControllers[0].text = '';
      phoneNumberControllers[0].text = '';
    }
    update();
  }
}
