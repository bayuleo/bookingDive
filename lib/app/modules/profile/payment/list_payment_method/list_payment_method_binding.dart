import 'package:bookingdive/app/modules/profile/payment/list_payment_method/list_payment_method_controller.dart';
import 'package:get/get.dart';

class ListPaymentMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ListPaymentMethodController>(
      ListPaymentMethodController(),
    );
  }
}
