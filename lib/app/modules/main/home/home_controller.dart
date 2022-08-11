import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/utils/permission_handler.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/cities_repository.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends BaseController {
  final LocationRepository _locationRepository = Get.find();

  final destinationTextEditingController = TextEditingController();
  final dateTextEditingController = TextEditingController();
  final diverTextEditingController = TextEditingController();
  final diverInputController = TextEditingController();

  final CitiesRepository _citiesRepository = Get.find();

  final listCities = <ResponseCitiesListData>[].obs;
  final selectedCountryName = ''.obs;
  final selectedCities = <String>[].obs;

  List<ResponseDataListLocation> listPopularDivingLocation = [];
  List<ResponseDataListLocation> listNearbyDivingLocation = [];
  PermissionStatus? isGrantedGetLocation;
  Placemark? placemark;
  Position? position;
  int numberDiverInput = 0;
  ResponseCitiesListCountries? selectedDestinationFilter;
  SearchBy? searchBy;
  bool isLoadingSearchDestination = false;

  @override
  void onInit() async {
    isGrantedGetLocation = await _checkPermissionAccessLocation();
    getListPopular();
    if (placemark != null || position != null) {
      getNearbyLocation();
    }
    super.onInit();
  }

  @override
  void onReady() async {
    getCities();
    super.onReady();
  }

  onTapDestination() {
    print('tap');
  }

  @override
  void onClose() async {
    destinationTextEditingController.dispose();
    dateTextEditingController.dispose();
    diverInputController.dispose();
    diverTextEditingController.dispose();
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

  void getCities() {
    isLoadingSearchDestination = true;
    update();
    callDataService<ResponseCitiesList>(
      () => _citiesRepository.getCities(),
      onSuccess: (res) {
        listCities.value = res.data;
      },
    );
    isLoadingSearchDestination = false;
    update();
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
