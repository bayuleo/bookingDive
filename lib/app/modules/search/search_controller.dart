import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_countries.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_data.dart';
import 'package:bookingdive/app/data/repository/cities_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';

enum SortBy { highRating, lowPrice, highPrice }

class SearchController extends BaseController {
  final CitiesRepository _citiesRepository = Get.find();
  final listCities = <ResponseCitiesListData>[].obs;
  final destinationBottomSelector = BottomSheetSelectorController();
  final destinationTextEditingController = TextEditingController();
  final dateTextEditingController = TextEditingController();
  final diverTextEditingController = TextEditingController();
  final diverInputController = TextEditingController();
  final listProductController = ScrollController();

  SearchArguments? searchArguments;
  int numberDiverInput = 0;
  ResponseCitiesListCountries? selectedDestinationFilter;
  SearchBy? searchBy;
  bool isLoadingSearchDestination = false;
  bool isShowButtonToFirstData = false;
  SortBy? sortBy;
  String sort = '0';

  @override
  void onInit() {
    listProductController.addListener(_onLoadMoreList);
    super.onInit();
  }

  @override
  void onReady() {
    searchArguments = Get.arguments;
    initValue();
    getCities();
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

  void getCities() {
    isLoadingSearchDestination = true;
    update();
    callDataService<ResponseCitiesList>(
      loading: false,
      () => _citiesRepository.getCities(),
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
}
