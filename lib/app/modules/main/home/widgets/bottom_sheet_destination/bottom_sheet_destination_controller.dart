import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_data.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/cities_repository.dart';
import 'package:get/get.dart';

class BottomSheetDestinationController extends BaseController {
  final CitiesRepository _citiesRepository = Get.find();

  // List<ResponseCitiesListData>? listCities;
  final listCities = <ResponseCitiesListData>[].obs;
  final selectedCountryName = ''.obs;
  final selectedCities = <String>[].obs;

  @override
  void onInit() async {
    getCities();
    super.onInit();
  }

  void getCities() {
    callDataService<ResponseCitiesList>(
      () => _citiesRepository.getCities(),
      onSuccess: (res) {
        listCities.value = res.data;
      },
    );
  }
}
