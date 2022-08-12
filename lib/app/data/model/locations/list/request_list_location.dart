import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestListLocation {

  const RequestListLocation({
    required this.city,
    required this.date,
    this.longitude,
    this.latitude,
    this.radius,
    this.inclusion,
    this.exlcusion,
    this.sortBy,
  });

  final String city;
  final String date;
  final String? longitude;
  final String? latitude;
  final String? radius;
  final List<String>? inclusion;
  final List<String>? exlcusion;
  final String? sortBy;

  factory RequestListLocation.fromJson(Map<String,dynamic> json) => RequestListLocation(
    city: json['city'].toString(),
    date: json['date'].toString(),
    longitude: json['longitude']?.toString(),
    latitude: json['latitude']?.toString(),
    radius: json['radius']?.toString(),
    inclusion: json['inclusion'] != null ? (json['inclusion'] as List? ?? []).map((e) => e as String).toList() : null,
    exlcusion: json['exlcusion'] != null ? (json['exlcusion'] as List? ?? []).map((e) => e as String).toList() : null,
    sortBy: json['sort_by']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'city': city,
    'date': date,
    'longitude': longitude,
    'latitude': latitude,
    'radius': radius,
    'inclusion': inclusion?.map((e) => e.toString()).toList(),
    'exlcusion': exlcusion?.map((e) => e.toString()).toList(),
    'sort_by': sortBy
  };

  RequestListLocation clone() => RequestListLocation(
    city: city,
    date: date,
    longitude: longitude,
    latitude: latitude,
    radius: radius,
    inclusion: inclusion?.toList(),
    exlcusion: exlcusion?.toList(),
    sortBy: sortBy
  );


  RequestListLocation copyWith({
    String? city,
    String? date,
    Optional<String?>? longitude,
    Optional<String?>? latitude,
    Optional<String?>? radius,
    Optional<List<String>?>? inclusion,
    Optional<List<String>?>? exlcusion,
    Optional<String?>? sortBy
  }) => RequestListLocation(
    city: city ?? this.city,
    date: date ?? this.date,
    longitude: checkOptional(longitude, () => this.longitude),
    latitude: checkOptional(latitude, () => this.latitude),
    radius: checkOptional(radius, () => this.radius),
    inclusion: checkOptional(inclusion, () => this.inclusion),
    exlcusion: checkOptional(exlcusion, () => this.exlcusion),
    sortBy: checkOptional(sortBy, () => this.sortBy),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestListLocation && city == other.city && date == other.date && longitude == other.longitude && latitude == other.latitude && radius == other.radius && inclusion == other.inclusion && exlcusion == other.exlcusion && sortBy == other.sortBy;

  @override
  int get hashCode => city.hashCode ^ date.hashCode ^ longitude.hashCode ^ latitude.hashCode ^ radius.hashCode ^ inclusion.hashCode ^ exlcusion.hashCode ^ sortBy.hashCode;
}
