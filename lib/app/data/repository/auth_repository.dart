import 'package:bookingdive/app/data/local/user_credentials_data_source.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/auth_data_source.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class AuthRepository {
  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn data);

  Future<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final _userCredentialsDataSource = Get.find<UserCredentialsDataSource>();
  final _authDataSource = Get.find<AuthDataSource>();

  @override
  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn dataRequest) async {
    final res = await _authDataSource.signIn(dataRequest);
    await _userCredentialsDataSource.saveToken(
      refreshToken: res.data.refreshToken,
      accessToken: res.data.token,
    );
    return res;
  }

  @override
  Future<void> signOut() async {
    await _authDataSource.signOut();
    await _userCredentialsDataSource.clearToken();
  }
}
