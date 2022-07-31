import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/model/form_edit_argument.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/auth_repository.dart';
import 'package:bookingdive/app/data/repository/user_credentials_repository.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:get/get.dart';

class EditProfileController extends BaseController {
  final AuthRepository _authRepository = Get.find();
  final UserCredentialsRepository _userCredentialsRepository = Get.find();

  ResponseProfileData? profileData;
  RequestUpdateProfile? _requestUpdateProfile;

  @override
  void onReady() {
    getDataProfileFromLocal();
    super.onReady();
  }

  Future<void> getDataProfileFromLocal() async {
    profileData = await _userCredentialsRepository.getCredentials().profile;
    update();
  }

  Future<void> onTapEdit({
    required String title,
    required String hintTop,
    String? hintBottom,
    required InputProfileType inputProfileType,
  }) async {
    await Get.toNamed(
      Routes.FORM_EDIT_PROFILE,
      arguments: FormEditArgument(
        title: title,
        hintTop: hintTop,
        hintBottom: hintBottom,
        profileData: profileData,
        inputProfileType: inputProfileType,
      ),
    );
    getDataProfileFromLocal();
  }

  void onSubmitValue(InputProfileType inputProfileType, String value) {
    generateUpdateProfileParam(inputProfileType, value);
    putProfileData();
  }

  void generateUpdateProfileParam(
      InputProfileType inputProfileType, String value) {
    _requestUpdateProfile = RequestUpdateProfile(
      firstName: profileData?.firstName ?? '',
      lastName: profileData?.lastName ?? '',
      email: profileData?.email ?? '',
      dateOfBirth: inputProfileType == InputProfileType.dateOfBirth
          ? value
          : profileData?.dateOfBirth ?? '',
      gender: inputProfileType == InputProfileType.gender
          ? value
          : profileData?.gender ?? '',
      countryCode: profileData?.countryCode ?? '',
      phoneNumber: profileData?.phoneNumber ?? '',
      countryId: profileData?.countryId ?? '',
      countryName: profileData?.countryName ?? '',
      address: profileData?.address ?? '',
      yearsOfDiving: inputProfileType == InputProfileType.yearsOfDiving
          ? value
          : profileData?.yearDiving.toString() ?? '',
      emergencyContact: profileData?.emergencyContact ?? '',
    );
  }

  Future<void> putProfileData() async {
    await callDataService<ResponseProfile>(
      () => _authRepository.updateProfile(
        idProfile: profileData!.idProfile.toString(),
        param: _requestUpdateProfile!,
      ),
      onSuccess: (res) async {
        var isSuccessUpdateToLocal =
            await _userCredentialsRepository.updateProfile(res.data);
        if (isSuccessUpdateToLocal) {
          SnackbarHelper.success(title: 'Success', desc: res.message);
          getDataProfileFromLocal();
        } else {
          SnackbarHelper.error(
              title: 'Failed', desc: 'Failed update data, please try again!');
        }
      },
    );
  }
}
