import 'package:bookingdive/app/modules/booking/booking_controller.dart';
import 'package:get/get.dart';

class BookingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingDetailController>(
      BookingDetailController(),
    );
  }
}
