import 'package:bookingdive/app/core/model/user_credentials.dart';
import 'package:bookingdive/app/data/local/user_credentials_data_source.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class UserCredentialsRepository {
  UserCredentials getCredentials();

  Future<bool> updateCredentials(UserCredentials credentials);

  Future<bool> updateProfile(ResponseProfileData profileData);
}

class UserCredentialsRepositoryImpl implements UserCredentialsRepository {
  final UserCredentialsDataSource _userCredentialsDataSource =
      Get.find<UserCredentialsDataSource>();

  @override
  UserCredentials getCredentials() {
    return _userCredentialsDataSource.getUserCredentials();
  }

  @override
  Future<bool> updateCredentials(UserCredentials credentials) {
    return _userCredentialsDataSource.updateUserCredentials(credentials);
  }

  @override
  Future<bool> updateProfile(ResponseProfileData profileData) {
    return _userCredentialsDataSource.updateProfile(profileData);
  }
}
