import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_countries.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_data.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/cities_repository.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:bookingdive/app/modules/main/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';

enum SortBy { highRating, lowPrice, highPrice }

class SearchController extends BaseController {
  final LocationRepository _locationRepository = Get.find();
  final HomeController homeController = Get.find();

  final CitiesRepository _citiesRepository = Get.find();
  final listCities = <ResponseCitiesListData>[].obs;
  final destinationBottomSelector = BottomSheetSelectorController();
  final destinationTextEditingController = TextEditingController();
  final destinationBottomInputTextEditingController = TextEditingController();
  final dateTextEditingController = TextEditingController();
  final diverTextEditingController = TextEditingController();
  final diverInputController = TextEditingController();
  final listProductController = ScrollController();

  List<ResponseDataListLocations> listLocations = [];
  List<String> listFilterSelectedInclusion = [];
  List<String> listFilterSelectedExclusion = [];

  int numberDiverInput = 0;
  ResponseCitiesListCountries? selectedDestinationFilter;
  SearchBy? searchBy;
  bool isLoadingSearchDestination = false;
  bool isShowButtonToFirstData = false;
  SortBy? sortBy;
  String sort = 'recommedation';
  final keyword = ''.obs;

  @override
  void onInit() async {
    // listProductController.addListener(_listListener);
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
  void onReady() {
    getCities();
    getLocations();
    update();
    super.onReady();
  }

  @override
  void onClose() {
    // listProductController.removeListener(_listListener);
    listProductController.dispose();
    destinationBottomSelector.dispose();
    destinationTextEditingController.dispose();
    destinationBottomInputTextEditingController.dispose();
    dateTextEditingController.dispose();
    diverTextEditingController.dispose();
    diverInputController.dispose();
    super.onClose();
  }

  getCities() {
    isLoadingSearchDestination = true;
    update();
    callDataService<ResponseCitiesList>(
      loading: false,
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

  void listListener() {
    if (listProductController.position.pixels >
        listProductController.position.minScrollExtent + 500) {
      if (!isShowButtonToFirstData) {
        isShowButtonToFirstData = true;
        update();
      }
    } else {
      isShowButtonToFirstData = false;
      update();
    }
  }

  void goToFirstData() {
    listProductController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void getLocations() async {
    callDataService<ResponseListLocations>(
      () => _locationRepository.getLocations(
        RequestListLocation(
          city: homeController.searchBy == SearchBy.country
              ? homeController.selectedDestinationFilter?.name ?? ''
              : homeController.selectedDestinationFilter?.cities.first.name ??
                  '',
          date: homeController.dateTextEditingController.text.trim(),
          inclusion: listFilterSelectedInclusion.join(','),
          exlcusion: listFilterSelectedExclusion.join(','),
        ),
      ),
      onSuccess: (res) {
        listLocations = res.data;
        update();
      },
    );
  }

  void onFilterInclusionChange(String filter, bool value) {
    if (value) {
      print('true');
      listFilterSelectedInclusion.add(filter);
    } else {
      print('else');
      listFilterSelectedInclusion.removeWhere((element) => element == filter);
    }
    update();
    print(listFilterSelectedInclusion);
  }

  void onFilterExclusionChange(String filter, bool value) {
    if (value) {
      print('true');
      listFilterSelectedExclusion.add(filter);
    } else {
      print('else');
      listFilterSelectedExclusion.removeWhere((element) => element == filter);
    }
    update();
    print(listFilterSelectedExclusion);
  }

  void onChangeSearchTextField(String text) {
    keyword.value = text;
  }

  void postWishlist(String id) {
    callDataService<String>(
        () => _locationRepository.postWishlist(RequestWishlist(listingId: id)),
        onSuccess: (res) {
      SnackbarHelper.success(title: "Favorited", desc: res);
      update();
    });
  }
}
