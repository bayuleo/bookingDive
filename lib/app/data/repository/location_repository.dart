import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/location_data_source.dart';
import 'package:get/get.dart';

abstract class LocationRepository {
  Future<ResponsePopularDiving> getPopularDivingLocation(
      RequestPopularDiving param);

  Future<ResponseDetailLocation> getDetailLocation(String idLocation);
}

class LocationRepositoryImpl implements LocationRepository {
  final _locationDataSource = Get.find<LocationDataSource>();

  @override
  Future<ResponsePopularDiving> getPopularDivingLocation(
      RequestPopularDiving param) async {
    return _locationDataSource.getPopularDivingLocation(param);
  }

  @override
  Future<ResponseDetailLocation> getDetailLocation(String idLocation) async {
    return _locationDataSource.getDetailLocation(idLocation);
  }
}
