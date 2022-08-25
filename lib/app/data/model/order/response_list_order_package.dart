import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseListOrderPackage {

  const ResponseListOrderPackage({
    required this.packageName,
    required this.dayCount,
    required this.nightCount,
    required this.minimumDiver,
    required this.diveCount,
    required this.image,
    required this.price,
  });

  final String packageName;
  final String dayCount;
  final String nightCount;
  final String minimumDiver;
  final String diveCount;
  final String image;
  final String price;

  factory ResponseListOrderPackage.fromJson(Map<String,dynamic> json) => ResponseListOrderPackage(
    packageName: json['package_name'].toString(),
    dayCount: json['day_count'].toString(),
    nightCount: json['night_count'].toString(),
    minimumDiver: json['minimum_diver'].toString(),
    diveCount: json['dive_count'].toString(),
    image: json['image'].toString(),
    price: json['price'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'package_name': packageName,
    'day_count': dayCount,
    'night_count': nightCount,
    'minimum_diver': minimumDiver,
    'dive_count': diveCount,
    'image': image,
    'price': price
  };

  ResponseListOrderPackage clone() => ResponseListOrderPackage(
    packageName: packageName,
    dayCount: dayCount,
    nightCount: nightCount,
    minimumDiver: minimumDiver,
    diveCount: diveCount,
    image: image,
    price: price
  );


  ResponseListOrderPackage copyWith({
    String? packageName,
    String? dayCount,
    String? nightCount,
    String? minimumDiver,
    String? diveCount,
    String? image,
    String? price
  }) => ResponseListOrderPackage(
    packageName: packageName ?? this.packageName,
    dayCount: dayCount ?? this.dayCount,
    nightCount: nightCount ?? this.nightCount,
    minimumDiver: minimumDiver ?? this.minimumDiver,
    diveCount: diveCount ?? this.diveCount,
    image: image ?? this.image,
    price: price ?? this.price,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseListOrderPackage && packageName == other.packageName && dayCount == other.dayCount && nightCount == other.nightCount && minimumDiver == other.minimumDiver && diveCount == other.diveCount && image == other.image && price == other.price;

  @override
  int get hashCode => packageName.hashCode ^ dayCount.hashCode ^ nightCount.hashCode ^ minimumDiver.hashCode ^ diveCount.hashCode ^ image.hashCode ^ price.hashCode;
}
