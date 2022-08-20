import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_countries.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_data.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/cities_repository.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';

enum SortBy { highRating, lowPrice, highPrice }

class SearchController extends BaseController {
  final LocationRepository _locationRepository = Get.find();

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

  SearchArguments? searchArguments;
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
    listProductController.addListener(_onLoadMoreList);
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
    searchArguments = Get.arguments;
    initValue();
    getCities();
    getLocations();
    update();
    super.onReady();
  }

  @override
  void onClose() {
    listProductController.removeListener(_onLoadMoreList);
    listProductController.dispose();
    destinationBottomSelector.dispose();
    destinationTextEditingController.dispose();
    dateTextEditingController.dispose();
    diverTextEditingController.dispose();
    diverInputController.dispose();
    super.onClose();
  }

  void initValue() {
    destinationTextEditingController.text =
        searchArguments?.searchBy == SearchBy.country
            ? searchArguments!.selectedDestination.name
            : searchArguments!.selectedDestination.cities.first.name;
    dateTextEditingController.text = searchArguments!.date;
    diverTextEditingController.text = searchArguments!.diver;
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

  void changeSearchData() {
    searchArguments = SearchArguments(
      selectedDestination: selectedDestinationFilter!,
      date: dateTextEditingController.text.trim(),
      diver: diverTextEditingController.text.trim(),
      searchBy: searchBy!,
    );
    update();
  }

  void _onLoadMoreList() {
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
          city: searchArguments?.searchBy == SearchBy.country
              ? searchArguments?.selectedDestination.name ?? ''
              : searchArguments?.selectedDestination.cities.first.name ?? '',
          date: searchArguments?.date ?? '',
          sortBy: sort,
          inclusion: listFilterSelectedInclusion,
          exlcusion: listFilterSelectedExclusion,
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
}
