import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseCitiesListData {

  const ResponseCitiesListData({
    required this.regionId,
    required this.region,
    required this.countries,
  });

  final String regionId;
  final String region;
  final List<ResponseCitiesListCountries> countries;

  factory ResponseCitiesListData.fromJson(Map<String,dynamic> json) => ResponseCitiesListData(
    regionId: json['region_id'].toString(),
    region: json['region'].toString(),
    countries: (json['countries'] as List? ?? []).map((e) => ResponseCitiesListCountries.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'region_id': regionId,
    'region': region,
    'countries': countries.map((e) => e.toJson()).toList()
  };

  ResponseCitiesListData clone() => ResponseCitiesListData(
    regionId: regionId,
    region: region,
    countries: countries.map((e) => e.clone()).toList()
  );


  ResponseCitiesListData copyWith({
    String? regionId,
    String? region,
    List<ResponseCitiesListCountries>? countries
  }) => ResponseCitiesListData(
    regionId: regionId ?? this.regionId,
    region: region ?? this.region,
    countries: countries ?? this.countries,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCitiesListData && regionId == other.regionId && region == other.region && countries == other.countries;

  @override
  int get hashCode => regionId.hashCode ^ region.hashCode ^ countries.hashCode;
}
