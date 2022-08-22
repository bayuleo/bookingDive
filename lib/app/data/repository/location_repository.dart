import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/location_data_source.dart';
import 'package:get/get.dart';

abstract class LocationRepository {
  Future<ResponseListLocation> getPopularDivingLocation(
      RequestPopularLocation param);

  Future<ResponseListLocation> getNearbyDivingLocation(
      RequestNearbyLocation param);

  Future<ResponseDetailLocation> getDetailLocation(
      String idLocation, RequestDetailLocation param);

  Future<ResponseListLocations> getLocations(RequestListLocation param);

  Future<ResponseReview> getReview(String idLocation);

  Future<ResponseListLocations> getWishlist();

  Future<String> postWishlist(RequestWishlist param);
}

class LocationRepositoryImpl implements LocationRepository {
  final _locationDataSource = Get.find<LocationDataSource>();

  @override
  Future<ResponseListLocation> getPopularDivingLocation(
      RequestPopularLocation param) async {
    return _locationDataSource.getPopularDivingLocation(param);
  }

  @override
  Future<ResponseDetailLocation> getDetailLocation(
      String idLocation, RequestDetailLocation param) async {
    return _locationDataSource.getDetailLocation(idLocation, param);
  }

  @override
  Future<ResponseListLocation> getNearbyDivingLocation(
      RequestNearbyLocation param) {
    return _locationDataSource.getNearbyDivingLocation(param);
  }

  @override
  Future<ResponseListLocations> getLocations(RequestListLocation param) {
    return _locationDataSource.getLocations(param);
  }

  @override
  Future<ResponseReview> getReview(String idLocation) {
    return _locationDataSource.getReview(idLocation);
  }

  @override
  Future<ResponseListLocations> getWishlist() {
    return _locationDataSource.getWishlist();
  }

  @override
  Future<String> postWishlist(RequestWishlist param) {
    return _locationDataSource.postWishlist(param);
  }
}
