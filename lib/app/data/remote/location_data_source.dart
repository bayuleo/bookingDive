import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class LocationDataSource {
  Future<ResponseListLocation> getPopularDivingLocation(
      RequestPopularLocation param);

  Future<ResponseListLocation> getNearbyDivingLocation(
      RequestNearbyLocation param);

  Future<ResponseDetailLocation> getDetailLocation(String idLocation);
}

class LocationDataSourceImpl implements LocationDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseListLocation> getPopularDivingLocation(
      RequestPopularLocation param) async {
    final queryParams = param.toJson();
    var response = await dioConfigure.dio.get(
      endpoints.location.popularLocation,
      queryParameters: queryParams,
    );
    return ResponseListLocation.fromJson(response.data);
  }

  @override
  Future<ResponseDetailLocation> getDetailLocation(String idLocation) async {
    var response = await dioConfigure.dio
        .get('${endpoints.location.listLocation}/$idLocation');
    return ResponseDetailLocation.fromJson(response.data);
  }

  @override
  Future<ResponseListLocation> getNearbyDivingLocation(
      RequestNearbyLocation param) async {
    final queryParams = param.toJson();
    var response = await dioConfigure.dio.get(
      endpoints.location.nearbyLocation,
      queryParameters: queryParams,
    );
    return ResponseListLocation.fromJson(response.data);
  }
}
