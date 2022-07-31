import 'dart:convert';

import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class AuthDataSource {
  Future<ResponseForgotPassword> forgotPassword(RequestForgotPassword data);

  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn data);

  Future<ResponseRegister> signUp(RequestRegister data);

  Future<ResponseAuthLogout> signOut();

  Future<ResponseProfile> updateProfile({
    required String idProfile,
    required RequestUpdateProfile param,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn data) async {
    var response = await dioConfigure.dio.post(
      endpoints.auth.signin,
      data: jsonEncode(data.toJson()),
    );
    return ResponseAuthSignIn.fromJson(response.data);
  }

  @override
  Future<ResponseAuthLogout> signOut() async {
    var response = await dioConfigure.dio.post(endpoints.auth.logout);
    return ResponseAuthLogout.fromJson(response.data);
  }

  @override
  Future<ResponseRegister> signUp(RequestRegister data) async {
    var response = await dioConfigure.dio.post(
      endpoints.auth.signup,
      data: jsonEncode(
        data.toJson(),
      ),
    );
    return ResponseRegister.fromJson(response.data);
  }

  @override
  Future<ResponseForgotPassword> forgotPassword(
      RequestForgotPassword data) async {
    var response = await dioConfigure.dio.post(
      endpoints.auth.forgotPassword,
      data: jsonEncode(
        data.toJson(),
      ),
    );
    return ResponseForgotPassword.fromJson(response.data);
  }

  @override
  Future<ResponseProfile> updateProfile({
    required String idProfile,
    required RequestUpdateProfile param,
  }) async {
    final queryParams = param.toJson();
    var response = await dioConfigure.dio.put(
        '${endpoints.auth.profile}/$idProfile',
        queryParameters: queryParams);
    return ResponseProfile.fromJson(response.data);
  }
}
