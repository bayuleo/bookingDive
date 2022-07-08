import 'package:bookingdive/app/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(
      MainController(),
    );
    Get.put<HomeController>(
      HomeController(),
    );
  }
}
