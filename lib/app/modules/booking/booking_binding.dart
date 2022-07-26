import 'package:bookingdive/app/modules/booking/booking_controller.dart';
import 'package:get/get.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingController>(
      BookingController(),
    );
  }
}
