import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/location_data_source.dart';
import 'package:get/get.dart';

abstract class LocationRepository {
  Future<ResponsePopularDiving> getPopularDivingLocation(
      RequestPopularDiving param);
}

class LocationRepositoryImpl implements LocationRepository {
  final _locationDataSource = Get.find<LocationDataSource>();

  @override
  Future<ResponsePopularDiving> getPopularDivingLocation(
      RequestPopularDiving param) async {
    return _locationDataSource.getPopularDivingLocation(param);
  }
}
