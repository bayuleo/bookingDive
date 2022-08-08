import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseCitiesListCountries {

  const ResponseCitiesListCountries({
    required this.id,
    required this.name,
    required this.flag,
    required this.cities,
  });

  final String id;
  final String name;
  final String flag;
  final List<ResponseCitiesListCities> cities;

  factory ResponseCitiesListCountries.fromJson(Map<String,dynamic> json) => ResponseCitiesListCountries(
    id: json['id'].toString(),
    name: json['name'].toString(),
    flag: json['flag'].toString(),
    cities: (json['cities'] as List? ?? []).map((e) => ResponseCitiesListCities.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'flag': flag,
    'cities': cities.map((e) => e.toJson()).toList()
  };

  ResponseCitiesListCountries clone() => ResponseCitiesListCountries(
    id: id,
    name: name,
    flag: flag,
    cities: cities.map((e) => e.clone()).toList()
  );


  ResponseCitiesListCountries copyWith({
    String? id,
    String? name,
    String? flag,
    List<ResponseCitiesListCities>? cities
  }) => ResponseCitiesListCountries(
    id: id ?? this.id,
    name: name ?? this.name,
    flag: flag ?? this.flag,
    cities: cities ?? this.cities,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCitiesListCountries && id == other.id && name == other.name && flag == other.flag && cities == other.cities;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ flag.hashCode ^ cities.hashCode;
}
