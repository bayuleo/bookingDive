import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/snackbar.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:get/get.dart';

class WhislistController extends BaseController {
  final LocationRepository _locationRepository = Get.find();

  List<ResponseDataListLocations>? wishlist = [];
  bool isEmpty = false;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    getWishlist();
    super.onReady();
  }

  void getWishlist() {
    callDataService<ResponseListLocations>(
        () => _locationRepository.getWishlist(), onSuccess: (res) {
      wishlist = res.data;
      update();
    });
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
