import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/data/model/review/response_review.dart';
import 'package:bookingdive/app/data/model/review/response_review_data.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:get/get.dart';

class ReviewController extends BaseController {
  final LocationRepository _locationRepository = Get.find();

  List<ResponseReviewData> listReview = [];
  final bool isEmpty = false;
  ReviewArguments? arguments;
  String filterRating = '0';

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    arguments = await Get.arguments;
    getReview();
    update();
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  Future<void> getReview() async {
    callDataService<ResponseReview>(
        () => _locationRepository.getReview(arguments!.id), onSuccess: (res) {
      listReview = res.data;
      update();
    });
  }

  void onTapFilter(String rating) {
    filterRating = rating;
    update();
  }
}
