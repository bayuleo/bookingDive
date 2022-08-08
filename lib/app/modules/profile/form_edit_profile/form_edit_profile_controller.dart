import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/auth_repository.dart';
import 'package:bookingdive/app/data/repository/user_credentials_repository.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/model/form_edit_argument.dart';

enum InputProfileType {
  name,
  email,
  phone,
  country,
  address,
  emergencyContact,
  dateOfBirth,
  gender,
  yearsOfDiving,
}

class FormEditProfileController extends BaseController {
  final AuthRepository _authRepository = Get.find();
  final UserCredentialsRepository _userCredentialsRepository = Get.find();
  FormEditArgument? initData;
  final topTextEditingController = TextEditingController();
  final bottomTextEditingController = TextEditingController();
  RequestUpdateProfile? _requestUpdateProfile;
  Country? country;

  @override
  void onReady() async {
    super.onReady();
    initData = await Get.arguments;
    updateValueTextEditing();
    update();
  }

  @override
  void onClose() {
    topTextEditingController.dispose();
    bottomTextEditingController.dispose();
    super.onClose();
  }

  void updateValueTextEditing() {
    switch (initData?.inputProfileType) {
      case InputProfileType.name:
        topTextEditingController.text = initData?.profileData?.firstName ?? '';
        bottomTextEditingController.text =
            initData?.profileData?.lastName ?? '';
        break;
      case InputProfileType.email:
        topTextEditingController.text = initData?.profileData?.email ?? '';
        break;
      case InputProfileType.phone:
        topTextEditingController.text =
            initData?.profileData?.phoneNumber ?? '';
        break;
      case InputProfileType.country:
        topTextEditingController.text =
            initData?.profileData?.countryName ?? '';
        break;
      case InputProfileType.address:
        topTextEditingController.text = initData?.profileData?.address ?? '';
        break;
      case InputProfileType.emergencyContact:
        topTextEditingController.text =
            initData?.profileData?.emergencyContact ?? '';
        break;
    }
  }

  void generateUpdateProfileParam() {
    _requestUpdateProfile = RequestUpdateProfile(
      firstName: initData?.inputProfileType == InputProfileType.name
          ? topTextEditingController.value.text.trim()
          : initData?.profileData?.firstName ?? '',
      lastName: initData?.inputProfileType == InputProfileType.name
          ? bottomTextEditingController.value.text.trim()
          : initData?.profileData?.lastName ?? '',
      email: initData?.inputProfileType == InputProfileType.email
          ? topTextEditingController.value.text.trim()
          : initData?.profileData?.email ?? '',
      dateOfBirth: initData?.profileData?.dateOfBirth ?? '',
      gender: initData?.profileData?.gender ?? '',
      countryCode: initData?.inputProfileType == InputProfileType.country
          ? country?.phoneCode ?? ''
          : initData?.profileData?.countryCode ?? '',
      phoneNumber: initData?.inputProfileType == InputProfileType.phone
          ? topTextEditingController.value.text.trim()
          : initData?.profileData?.phoneNumber ?? '',
      countryId: initData?.inputProfileType == InputProfileType.country
          ? country?.isoCode ?? ''
          : initData?.profileData?.countryId ?? '',
      countryName: initData?.inputProfileType == InputProfileType.country
          ? country?.name ?? ''
          : initData?.profileData?.countryName ?? '',
      address: initData?.inputProfileType == InputProfileType.address
          ? topTextEditingController.value.text.trim()
          : initData?.profileData?.address ?? '',
      yearsOfDiving: initData?.profileData?.yearDiving.toString() ?? '',
      emergencyContact:
          initData?.inputProfileType == InputProfileType.emergencyContact
              ? topTextEditingController.value.text.trim()
              : initData?.profileData?.emergencyContact ?? '',
    );
  }

  void onClickSubmit() {
    generateUpdateProfileParam();
    putProfileData();
  }

  Future<void> putProfileData() async {
    await callDataService<ResponseProfile>(
      () => _authRepository.updateProfile(
        idProfile: initData!.profileData!.idProfile.toString(),
        param: _requestUpdateProfile!,
      ),
      onSuccess: (res) async {
        var isSuccessUpdateToLocal =
            await _userCredentialsRepository.updateProfile(res.data);
        if (isSuccessUpdateToLocal) {
          Get.back();
          SnackbarHelper.success(title: 'Success', desc: res.message);
        } else {
          SnackbarHelper.error(
              title: 'Failed', desc: 'Failed update data, please try again!');
        }
      },
    );
  }
}
