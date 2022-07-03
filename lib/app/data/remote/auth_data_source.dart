import 'dart:convert';

import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class AuthDataSource {
  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn data);

  Future<void> signOut();
}

class AuthDataSourceImpl implements AuthDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseAuthSignIn> signIn(RequestAuthSignIn data) async {
    var response = await dioConfigure.dioMock.post(
      endpoints.auth.signin,
      data: jsonEncode(data.toJson()),
    );
    return ResponseAuthSignIn.fromJson(response.data);
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
  }
}
