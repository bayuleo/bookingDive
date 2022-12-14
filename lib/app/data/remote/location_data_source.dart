import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class LocationDataSource {
  Future<ResponseListLocation> getPopularDivingLocation(
      RequestPopularLocation param);

  Future<ResponseListLocation> getNearbyDivingLocation(
      RequestNearbyLocation param);

  Future<ResponseDetailLocation> getDetailLocation(
      String idLocation, RequestDetailLocation param);

  Future<ResponseListLocations> getLocations(RequestListLocation param);

  Future<ResponseReview> getReview(String idLocation);

  Future<ResponseOrder> postOrder(RequestOrder param);

  Future<ResponseListOrder> getOrder();

  Future<ResponseListLocations> getWishlist();

  Future<String> postWishlist(RequestWishlist param);
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
  Future<ResponseDetailLocation> getDetailLocation(
      String idLocation, RequestDetailLocation param) async {
    final queryParams = param.toJson();
    queryParams.removeWhere((key, value) => value == '' || value == null);
    var response = await dioConfigure.dioMock.get(
      '${endpoints.location.listLocation}/$idLocation',
      queryParameters: queryParams,
    );
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

  @override
  Future<ResponseListLocations> getLocations(RequestListLocation param) async {
    final queryParams = param.toJson();
    queryParams.removeWhere((key, value) => value == '' || value == null);
    var response = await dioConfigure.dioMock.get(
      endpoints.location.listLocation,
      queryParameters: queryParams,
    );
    return ResponseListLocations.fromJson(response.data);
  }

  @override
  Future<ResponseReview> getReview(String idLocation) async {
    var response = await dioConfigure.dioMock.get(
      '${endpoints.location.review}/$idLocation',
    );
    return ResponseReview.fromJson(response.data);
  }

  @override
  Future<ResponseOrder> postOrder(RequestOrder param) async {
    final queryParams = param.toJson();
    queryParams.removeWhere((key, value) => value == '' || value == null);
    var response = await dioConfigure.dioMock.post(
      endpoints.location.order,
      queryParameters: queryParams,
    );
    return ResponseOrder.fromJson(response.data);
  }

  @override
  Future<ResponseListLocations> getWishlist() async {
    var response = await dioConfigure.dioMock.get(
      endpoints.location.wishlist,
    );
    return ResponseListLocations.fromJson(response.data);
  }

  @override
  Future<String> postWishlist(RequestWishlist param) async {
    final queryParams = param.toJson();
    queryParams.removeWhere((key, value) => value == '' || value == null);
    var response = await dioConfigure.dioMock.post(
      endpoints.location.wishlist,
      queryParameters: queryParams,
    );
    return ResponseWishlist.fromJson(response.data).message;
  }

  @override
  Future<ResponseListOrder> getOrder() async {
    var response = await dioConfigure.dioMock.get(
      endpoints.location.orderList,
    );
    return ResponseListOrder.fromJson(response.data);
  }
}
