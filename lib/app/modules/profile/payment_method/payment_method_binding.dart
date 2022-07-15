import 'package:bookingdive/app/modules/profile/payment_method/payment_method_controller.dart';
import 'package:get/get.dart';

class PaymentMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentMethodController>(
      PaymentMethodController(),
    );
  }
}
