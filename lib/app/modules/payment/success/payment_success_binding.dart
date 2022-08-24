import 'package:bookingdive/app/modules/payment/success/payment_success_controller.dart';
import 'package:get/get.dart';

class PaymentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentSuccessController>(
      PaymentSuccessController(),
    );
  }
}
