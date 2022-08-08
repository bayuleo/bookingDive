import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class PaymentDataSource {
  Future<ResponsePaymentProfile> getPaymentProfile();

  Future<ResponsePaymentProfile> postPaymentProfile(
      RequestAddPaymentProfile param);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponsePaymentProfile> getPaymentProfile() async {
    var response =
        await dioConfigure.dioMock.get(endpoints.payment.profilePayment);
    return ResponsePaymentProfile.fromJson(response.data);
  }

  @override
  Future<ResponsePaymentProfile> postPaymentProfile(
      RequestAddPaymentProfile param) async {
    var response = await dioConfigure.dioMock.post(
        endpoints.payment.profilePayment,
        queryParameters: param.toJson());
    return ResponsePaymentProfile.fromJson(response.data);
  }
}
