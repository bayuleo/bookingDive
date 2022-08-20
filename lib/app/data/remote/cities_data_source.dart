import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/network/dio_config.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';

abstract class CitiesDataSource {
  Future<ResponseCitiesList> getCities(RequestCitiestList param);
}

class CitiesDataSourceImpl implements CitiesDataSource {
  final dioConfigure = Get.find<DioConfigure>();
  final endpoints = Get.find<Endpoints>();

  @override
  Future<ResponseCitiesList> getCities(RequestCitiestList param) async {
    final queryParams = param.toJson();
    queryParams.removeWhere((key, value) => value == '' || value == null);
    var response = await dioConfigure.dioMock.get(
      endpoints.location.listCity,
      queryParameters: queryParams,
    );
    return ResponseCitiesList.fromJson(response.data);
  }
}
