import 'package:bookingdive/app/core/configs/firebase_config.dart';
import 'package:bookingdive/app/data/local/user_credentials_data_source.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/auth_data_source.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class AuthRepository {
  Future<ResponseForgotPassword> forgotPassword(RequestForgotPassword data);

  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn data);

  Future<ResponseRegister> signUp(RequestRegister data);

  Future<ResponseAuthLogout> signOut();

  Future<ResponseProfile> updateProfile({
    required String idProfile,
    required RequestUpdateProfile param,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final _userCredentialsDataSource = Get.find<UserCredentialsDataSource>();
  final _authDataSource = Get.find<AuthDataSource>();

  @override
  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn dataRequest) async {
    final res = await _authDataSource.signIn(dataRequest);
    await _userCredentialsDataSource.saveUserCredentials(
        refreshToken: res.data.refreshToken,
        accessToken: res.data.accessToken,
        profile: res.data.profile);
    return res;
  }

  @override
  Future<ResponseAuthLogout> signOut() async {
    final res = await _authDataSource.signOut(); //TODO integration logout
    FirebaseConfig.signOutFirebase();
    await _userCredentialsDataSource.clearToken();
    return res;
  }

  @override
  Future<ResponseRegister> signUp(RequestRegister data) async {
    final res = await _authDataSource.signUp(data);
    await _userCredentialsDataSource.saveUserCredentials(
        refreshToken: res.data.refreshToken,
        accessToken: res.data.accessToken,
        profile: res.data.profile);
    return res;
  }

  @override
  Future<ResponseForgotPassword> forgotPassword(RequestForgotPassword data) {
    return _authDataSource.forgotPassword(data);
  }

  @override
  Future<ResponseProfile> updateProfile({
    required String idProfile,
    required RequestUpdateProfile param,
  }) {
    return _authDataSource.updateProfile(
      idProfile: idProfile,
      param: param,
    );
  }
}
