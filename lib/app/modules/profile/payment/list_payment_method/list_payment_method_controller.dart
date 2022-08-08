import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/payment_repository.dart';
import 'package:get/get.dart';

class ListPaymentMethodController extends BaseController {
  final PaymentRepository _paymentRepository = Get.find();

  String? cardNumber;

  @override
  void onReady() {
    getDataPaymentProfile();
    super.onReady();
  }

  Future<void> getDataPaymentProfile() async {
    await callDataService<ResponsePaymentProfile>(
      () => _paymentRepository.getPaymentProfile(),
      onSuccess: (res) {
        cardNumber = res.data.cardNumber;
        update();
      },
    );
  }

  Future<void> deleteDataPaymentProfile() async {
    // TODO integration delete
  }
}
