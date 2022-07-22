import 'package:bookingdive/app/modules/location/loaction_controller.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocationController>(
      LocationController(),
    );
  }
}
