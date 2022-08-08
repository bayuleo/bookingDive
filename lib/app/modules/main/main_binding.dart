import 'package:bookingdive/app/modules/main/booking/booking_controller.dart';
import 'package:bookingdive/app/modules/main/home/widgets/bottom_sheet_destination/bottom_sheet_destination_controller.dart';
import 'package:bookingdive/app/modules/main/inbox/inbox_controller.dart';
import 'package:bookingdive/app/modules/main/profile/profile_controller.dart';
import 'package:bookingdive/app/modules/main/whislist/whislist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'home/home_controller.dart';
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
    Get.put<ProfileController>(
      ProfileController(),
    );
    Get.put<WhislistController>(
      WhislistController(),
    );
    Get.put<InboxController>(
      InboxController(),
    );
    Get.put<BookingController>(
      BookingController(),
    );
    Get.put<BottomSheetDestinationController>(
      BottomSheetDestinationController(),
    );
  }
}
