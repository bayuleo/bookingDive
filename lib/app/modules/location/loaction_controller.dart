import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:get/get.dart';

class LocationController extends BaseController {
  final LocationRepository _locationRepository = Get.find();

  ResponseDetailLocationData? data;
  String? locationId;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    locationId = Get.arguments ?? '0';
    await getDetailLocation();
    super.onReady();
  }

  Future<void> getDetailLocation() async {
    callDataService<ResponseDetailLocation>(
        () => _locationRepository.getDetailLocation('3'), onSuccess: (res) {
      data = res.data;
      update();
    });
  }
}
