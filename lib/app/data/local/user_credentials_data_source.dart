import 'dart:convert';

import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiver/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserCredentialsDataSource {
  UserCredentials getUserCredentials();

  Future<bool> updateUserCredentials(UserCredentials credentials);

  Future<bool> updateProfile(ResponseProfileData profileData);

  Future<bool> clearToken();

  Future<bool> saveUserCredentials({
    required String refreshToken,
    required String accessToken,
    required ResponseProfileData profile,
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
      required ResponseProfileData profile}) {
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

  @override
  Future<bool> updateProfile(ResponseProfileData profileData) {
    final credential = getUserCredentials();
    return updateUserCredentials(
      credential.copyWith(
        profile: Optional.of(profileData),
      ),
    );
  }
}
