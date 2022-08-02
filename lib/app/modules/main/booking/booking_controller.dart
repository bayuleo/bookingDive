import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends BaseController
    with GetSingleTickerProviderStateMixin {
  int tabActive = 1;
  late TabController tabController;

  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(onChangeTab);
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
    print(tabController.index);
  }

  @override
  void onClose() {
    tabController.removeListener(onChangeTab);
    tabController.dispose();
    super.onClose();
  }
}
