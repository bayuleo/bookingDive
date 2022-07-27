import 'package:bookingdive/app/modules/payment/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(
      PaymentController(),
    );
  }
}
