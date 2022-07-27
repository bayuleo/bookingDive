import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../flavors/flavors.dart';
import '../data/repository/user_credentials_repository.dart';

class DioConfigure {
  static final UserCredentialsRepository _userCredentialsRepository =
      Get.find();

  // contact with real API
  Dio dio = createDio();

  // contact with Mock API
  Dio dioMock = createDio(true);

  final tokenDio = Dio(BaseOptions(baseUrl: FlavorConfigs.baseURL));

  DioConfigure._internal();

  static final _singleton = DioConfigure._internal();

  factory DioConfigure() => _singleton;

  static Dio createDio([bool isMock = false]) {
    var dio = Dio(
      BaseOptions(
        baseUrl: isMock ? FlavorConfigs.mockURL : FlavorConfigs.baseURL,
        receiveTimeout: 15000,
        // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
        headers: <String, String>{
          'Authorization':
              'Bearer ${_userCredentialsRepository.getCredentials().accessToken}',
          'Content-Type': 'application/json',
          'app-id': '1',
        },
      ),
    );

    dio.interceptors.addAll({
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    });

    return dio;
  }

  void updateToken() {
    _addHeaderEntries({
      'Authorization':
          'Bearer ${_userCredentialsRepository.getCredentials().accessToken}',
    });
  }

  void addOtp(String otp) {
    _addHeaderEntries({
      'Header-OTP': otp,
    });
  }

  void removeOtp() {
    _removeHeaderEntry('Header-OTP');
  }

  void _addHeaderEntries(Map<String, String> entries) {
    dio.options.headers.addEntries(entries.entries);
  }

  void _removeHeaderEntry(String key) {
    dio.options.headers.remove(key);
  }
}
