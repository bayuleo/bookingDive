import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseCitiesListCities {

  const ResponseCitiesListCities({
    required this.cityId,
    required this.name,
  });

  final String cityId;
  final String name;

  factory ResponseCitiesListCities.fromJson(Map<String,dynamic> json) => ResponseCitiesListCities(
    cityId: json['city_id'].toString(),
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'city_id': cityId,
    'name': name
  };

  ResponseCitiesListCities clone() => ResponseCitiesListCities(
    cityId: cityId,
    name: name
  );


  ResponseCitiesListCities copyWith({
    String? cityId,
    String? name
  }) => ResponseCitiesListCities(
    cityId: cityId ?? this.cityId,
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCitiesListCities && cityId == other.cityId && name == other.name;

  @override
  int get hashCode => cityId.hashCode ^ name.hashCode;
}
