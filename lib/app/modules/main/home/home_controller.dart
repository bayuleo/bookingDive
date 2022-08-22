import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/utils/permission_handler.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/core/utils/time.dart';
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

  final CitiesRepository _citiesRepository = Get.find();

  final listCities = <ResponseCitiesListData>[].obs;
  final selectedCountryName = 'Malaysia'.obs;
  final selectedCities = <String>[].obs;

  List<ResponseDataListLocation> listPopularDivingLocation = [];
  List<ResponseDataListLocation> listNearbyDivingLocation = [];
  PermissionStatus? isGrantedGetLocation;
  Placemark? placemark;
  Position? position;
  int numberDiverInput = 1;
  ResponseCitiesListCountries? selectedDestinationFilter;
  SearchBy? searchBy = SearchBy.country;
  bool isLoadingSearchDestination = false;

  //Data bottom sheet search
  final destinationBottomInputTextEditingController = TextEditingController();
  final diverInputController = TextEditingController();
  final keyword = ''.obs;

  final destinationTextEditingController = TextEditingController();
  final dateTextEditingController = TextEditingController();
  final diverTextEditingController = TextEditingController();

  @override
  void onInit() async {
    isGrantedGetLocation = await _checkPermissionAccessLocation();
    getListPopular();
    if (placemark != null || position != null) {
      getNearbyLocation();
    }
    debounce<String>(
      keyword,
      (_) async {
        await getCities();
      },
      time: const Duration(milliseconds: 500),
    );
    super.onInit();
  }

  @override
  void onReady() async {
    initDataSearch();
    getCities();
    super.onReady();
  }

  initDataSearch() {
    selectedDestinationFilter = ResponseCitiesListCountries(
        id: "1", name: placemark?.country ?? 'Malaysia', flag: '', cities: []);
    destinationTextEditingController.text = placemark?.country ?? 'Malaysia';
    dateTextEditingController.text =
        TimeHelper.formatDate(DateTime.now(), 'dd MMMM yyyy');
    diverTextEditingController.text = "1";
    update();
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

  getCities() {
    isLoadingSearchDestination = true;
    update();
    callDataService<ResponseCitiesList>(
      () => _citiesRepository.getCities(
        RequestCitiestList(
          keyword: destinationBottomInputTextEditingController.text.trim(),
        ),
      ),
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

  void onTapItemPopular(ResponseDataListLocation item) async {
    await Get.toNamed(Routes.LOCATION,
        arguments: LocationArguments(
          locationName: item.productName,
          date: TimeHelper.formatDate(DateTime.now(), 'dd MMM yyyy'),
          diver: "1",
          id: item.productId.toString(),
        )
        // arguments: SearchDetailArguments(
        //   selectedDestination: item.productName,
        //   date: dateTextEditingController.text.trim(),
        //   diver: diverTextEditingController.text.trim(),
        //   searchBy: searchBy!,
        // ),
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

  void onChangeSearchTextField(String text) {
    keyword.value = text;
  }

  postWishlist(String id) {
    callDataService<String>(
        () => _locationRepository.postWishlist(RequestWishlist(listingId: id)),
        onSuccess: (res) {
      SnackbarHelper.success(title: "Favorited", desc: res);
      update();
    });
  }
}
