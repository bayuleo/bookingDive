import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class LocationDataSource {
  Future<ResponsePopularDiving> getPopularDivingLocation(
      RequestPopularDiving param);
}

class LocationDataSourceImpl implements LocationDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponsePopularDiving> getPopularDivingLocation(
      RequestPopularDiving param) async {
    final queryParams = param.toJson();
    var response = await dioConfigure.dio.get(
      endpoints.location.popularDiving,
      queryParameters: queryParams,
    );
    return ResponsePopularDiving.fromJson(response.data);
  }
}
