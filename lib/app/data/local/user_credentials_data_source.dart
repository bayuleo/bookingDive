import 'dart:convert';

import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiver/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth/sign_in/response_auth_sign_in_data_profile.dart';

abstract class UserCredentialsDataSource {
  UserCredentials getUserCredentials();

  Future<bool> updateUserCredentials(UserCredentials credentials);

  Future<bool> clearToken();

  Future<bool> saveUserCredentials({
    required String refreshToken,
    required String accessToken,
    required ResponseAuthSignInDataProfile profile,
  });
}

class UserCredentialsDataSourceImpl implements UserCredentialsDataSource {
  final _sharedPreferences = Get.find<SharedPreferences>();

  static const key = 'user_credentials';

  @override
  Future<bool> clearToken() {
    return _sharedPreferences.remove(key);
    // final credential = getUserCredentials();
    // return updateUserCredentials(
    //   credential.copyWith(
    //     accessToken: null,
    //     refreshToken: null,
    //   ),
    // );
  }

  @override
  Future<bool> saveUserCredentials(
      {required String refreshToken,
      required String accessToken,
      required ResponseAuthSignInDataProfile profile}) {
    final credential = getUserCredentials();
    return updateUserCredentials(
      credential.copyWith(
          accessToken: Optional.of(accessToken),
          refreshToken: Optional.of(refreshToken),
          profile: Optional.of(profile)),
    );
  }

  @override
  UserCredentials getUserCredentials() {
    final rawCredentials = _sharedPreferences.getString(key);
    if (rawCredentials == null) {
      // return const UserCredentials(isFirstLaunch: true);
      return const UserCredentials();
    } else {
      return UserCredentials.fromJson(
        jsonDecode(rawCredentials),
      );
    }
  }

  @override
  Future<bool> updateUserCredentials(UserCredentials credentials) {
    return _sharedPreferences.setString(
      key,
      jsonEncode(
        credentials.toJson(),
      ),
    );
  }
}
