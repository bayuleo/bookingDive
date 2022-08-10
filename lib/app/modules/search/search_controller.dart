import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';

class SearchController extends BaseController {
  final destinationBottomSelector = BottomSheetSelectorController();
  SearchArguments? searchArguments;

  @override
  void onReady() {
    searchArguments = Get.arguments;
    update();
    super.onReady();
  }
}
