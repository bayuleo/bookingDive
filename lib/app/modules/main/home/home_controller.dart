import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final LocationRepository _locationRepository = Get.find();
  final destinationBottomSelector = BottomSheetSelectorController();

  List<ResponseDataPopularDiving> listPopularDivingLocation = [];

  @override
  void onReady() async {
    getListPopular();
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

  void getListPopular() {
    callDataService<ResponsePopularDiving>(
      () => _locationRepository.getPopularDivingLocation(
        RequestPopularDiving(page: 1, limit: 20),
      ),
      onSuccess: (res) {
        listPopularDivingLocation = res.data;
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
}
