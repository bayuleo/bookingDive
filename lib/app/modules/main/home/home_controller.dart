import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';

class HomeController extends BaseController {
  final destinationBottomSelector = BottomSheetSelectorController();

  @override
  void onReady() async {
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
}
