import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/permission_handler.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends BaseController {
  final LocationRepository _locationRepository = Get.find();
  final destinationBottomSelector = BottomSheetSelectorController();

  List<ResponseDataListLocation> listPopularDivingLocation = [];
  List<ResponseDataListLocation> listNearbyDivingLocation = [];
  PermissionStatus? isGrantedGetLocation;
  Placemark? placemark;
  Position? position;

  @override
  void onInit() async {
    isGrantedGetLocation = await _checkPermissionAccessLocation();
    super.onInit();
  }

  @override
  void onReady() async {
    getListPopular();
    if (placemark != null || position != null) {
      getNearbyLocation();
    }
    super.onReady();
  }

  onTapDestination() {
    print('tap');
  }

  @override
  void onClose() async {
    destinationBottomSelector.dispose();
    super.onClose();
  }

  void getListPopular() {
    callDataService<ResponseListLocation>(
      () => _locationRepository.getPopularDivingLocation(
        RequestPopularLocation(page: 1, limit: 20),
      ),
      onSuccess: (res) {
        listPopularDivingLocation = res.data;
        update();
      },
    );
  }

  void getNearbyLocation() {
    callDataService<ResponseListLocation>(
      () => _locationRepository.getNearbyDivingLocation(
        RequestNearbyLocation(
            latitude: position!.latitude.toString(),
            longitude: position!.longitude.toString(),
            cities: placemark?.administrativeArea ?? '',
            page: 1,
            limit: 20),
      ),
      onSuccess: (res) {
        listNearbyDivingLocation = res.data;
        update();
      },
    );
  }

  void onTapItemPopular(String locationId) async {
    await Get.toNamed(
      Routes.LOCATION,
      arguments: locationId,
    );
  }

  Future<PermissionStatus> _checkPermissionAccessLocation() async {
    final handler = Get.find<PermissionHandler>();
    var status = await handler.status(Permission.location);
    if (!status.isGranted) {
      PermissionStatus permissionResult =
          await handler.request(Permission.location);
      if (permissionResult != PermissionStatus.granted) {
        return PermissionStatus.denied;
      }
    }
    await _getLocation();
    return PermissionStatus.granted;
  }

  Future<void> _getLocation() async {
    position = await Geolocator.getCurrentPosition();
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position!.latitude,
        position!.longitude,
      );
      placemark = placemarks[0];
      print(placemarks[0]);
      print(position);
    } catch (err) {}
    print(position);
  }
}
