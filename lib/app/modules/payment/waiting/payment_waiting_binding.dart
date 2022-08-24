import 'package:bookingdive/app/modules/payment/waiting/payment_waiting_controller.dart';
import 'package:get/get.dart';

class PaymentWaitingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentWaitingController>(
      PaymentWaitingController(),
    );
  }
}
