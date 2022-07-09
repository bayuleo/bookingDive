import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseDataSpot {

  const ResponseDataSpot({
    required this.country,
    required this.cities,
  });

  final String country;
  final List<ResponseDataCitySpot> cities;

  factory ResponseDataSpot.fromJson(Map<String,dynamic> json) => ResponseDataSpot(
    country: json['country'].toString(),
    cities: (json['cities'] as List? ?? []).map((e) => ResponseDataCitySpot.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'country': country,
    'cities': cities.map((e) => e.toJson()).toList()
  };

  ResponseDataSpot clone() => ResponseDataSpot(
    country: country,
    cities: cities.map((e) => e.clone()).toList()
  );


  ResponseDataSpot copyWith({
    String? country,
    List<ResponseDataCitySpot>? cities
  }) => ResponseDataSpot(
    country: country ?? this.country,
    cities: cities ?? this.cities,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDataSpot && country == other.country && cities == other.cities;

  @override
  int get hashCode => country.hashCode ^ cities.hashCode;
}
