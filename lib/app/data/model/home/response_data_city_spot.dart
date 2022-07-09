import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseDataCitySpot {

  const ResponseDataCitySpot({
    required this.id,
    required this.city,
  });

  final String id;
  final String city;

  factory ResponseDataCitySpot.fromJson(Map<String,dynamic> json) => ResponseDataCitySpot(
    id: json['id'].toString(),
    city: json['city'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'city': city
  };

  ResponseDataCitySpot clone() => ResponseDataCitySpot(
    id: id,
    city: city
  );


  ResponseDataCitySpot copyWith({
    String? id,
    String? city
  }) => ResponseDataCitySpot(
    id: id ?? this.id,
    city: city ?? this.city,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDataCitySpot && id == other.id && city == other.city;

  @override
  int get hashCode => id.hashCode ^ city.hashCode;
}
