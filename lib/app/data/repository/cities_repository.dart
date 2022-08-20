import 'package:bookingdive/app/data/model/cities/response_cities_list.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/remote/cities_data_source.dart';
import 'package:get/get.dart';

abstract class CitiesRepository {
  Future<ResponseCitiesList> getCities(RequestCitiestList param);
}

class CitiesRepositoryImpl implements CitiesRepository {
  final CitiesDataSource _citiesDataSource = Get.find();

  @override
  Future<ResponseCitiesList> getCities(RequestCitiestList param) {
    return _citiesDataSource.getCities(param);
  }
}
