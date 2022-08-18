import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LocationController extends BaseController {
  final LocationRepository _locationRepository = Get.find();

  ResponseDetailLocationData? data;
  SearchDetailArguments? searchDetailArguments;
  List<ResponseReviewData> listReview = [];
  String? locationId;
  int selectedDescription = 0;
  String? dummyVideoUrl = 'https://youtu.be/cQGfLDnmWS8';
  String videoUrl = '';

  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() async {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.onInit();
  }

  @override
  void onReady() async {
    searchDetailArguments = Get.arguments;
    locationId = searchDetailArguments?.id ?? '0';
    update();
    super.onReady();
  }

  @override
  void onClose() async {
    youtubePlayerController.dispose();
    super.onReady();
  }

  void onChangeDescription(int index) {
    selectedDescription = index;
    update();
  }

  Future<void> getDetailLocation() async {
    callDataService<ResponseDetailLocation>(
        () => _locationRepository.getDetailLocation(locationId!),
        onSuccess: (res) {
      data = res.data;
      youtubePlayerController
          .cue(YoutubePlayer?.convertUrlToId(data?.video ?? '') ?? '');
      update();
    });
  }

  Future<void> getReview() async {
    callDataService<ResponseReview>(
        () => _locationRepository.getReview(locationId!), onSuccess: (res) {
      listReview = res.data;
      update();
    });
  }
}
