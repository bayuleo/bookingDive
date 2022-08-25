import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final LocationRepository _locationRepository = Get.find();
  List<ResponseListOrderData>? data = [];

  int tabActive = 1;
  bool isHideDetail = true;
  late TabController tabController;

  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(onChangeTab);
    getListOrder();
    super.onInit();
  }

  void onTapTab(int position) {
    tabActive = position;
    tabController.index = position - 1;
    update();
  }

  void onChangeTab() {
    tabActive = tabController.index + 1;
    update();
  }

  Future<void> getListOrder() async {
    callDataService<ResponseListOrder>(
      () => _locationRepository.getOrder(),
      onSuccess: (res) {
        data = res.data;
        update();
      },
    );
  }

  changeShowDetail() {
    isHideDetail = !isHideDetail;
    update();
  }

  @override
  void onClose() {
    tabController.removeListener(onChangeTab);
    tabController.dispose();
    super.onClose();
  }
}
