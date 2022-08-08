import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/payment_data_source.dart';
import 'package:get/get.dart';

abstract class PaymentRepository {
  Future<ResponsePaymentProfile> getPaymentProfile();

  Future<ResponsePaymentProfile> postPaymentProfile(
      RequestAddPaymentProfile param);
}

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource _paymentDataSource = Get.find<PaymentDataSource>();

  @override
  Future<ResponsePaymentProfile> getPaymentProfile() {
    return _paymentDataSource.getPaymentProfile();
  }

  @override
  Future<ResponsePaymentProfile> postPaymentProfile(
      RequestAddPaymentProfile param) {
    return _paymentDataSource.postPaymentProfile(param);
  }
}
