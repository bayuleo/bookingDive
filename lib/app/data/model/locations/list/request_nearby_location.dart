import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestNearbyLocation {

  const RequestNearbyLocation({
    required this.latitude,
    required this.longitude,
    required this.cities,
    required this.page,
    required this.limit,
  });

  final String latitude;
  final String longitude;
  final String cities;
  final int page;
  final int limit;

  factory RequestNearbyLocation.fromJson(Map<String,dynamic> json) => RequestNearbyLocation(
    latitude: json['latitude'].toString(),
    longitude: json['longitude'].toString(),
    cities: json['cities'].toString(),
    page: json['page'] as int,
    limit: json['limit'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'cities': cities,
    'page': page,
    'limit': limit
  };

  RequestNearbyLocation clone() => RequestNearbyLocation(
    latitude: latitude,
    longitude: longitude,
    cities: cities,
    page: page,
    limit: limit
  );


  RequestNearbyLocation copyWith({
    String? latitude,
    String? longitude,
    String? cities,
    int? page,
    int? limit
  }) => RequestNearbyLocation(
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    cities: cities ?? this.cities,
    page: page ?? this.page,
    limit: limit ?? this.limit,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestNearbyLocation && latitude == other.latitude && longitude == other.longitude && cities == other.cities && page == other.page && limit == other.limit;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ cities.hashCode ^ page.hashCode ^ limit.hashCode;
}
