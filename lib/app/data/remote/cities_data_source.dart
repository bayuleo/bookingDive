import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class CitiesDataSource {
  Future<ResponseCitiesList> getCities();
}

class CitiesDataSourceImpl implements CitiesDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseCitiesList> getCities() async {
    var response = await dioConfigure.dioMock.get(endpoints.location.listCity);
    return ResponseCitiesList.fromJson(response.data);
  }
}
