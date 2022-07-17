import 'package:get/get.dart';

import 'add_payment_method_controller.dart';

class AddPaymentMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddPaymentMethodController>(
      AddPaymentMethodController(),
    );
  }
}
