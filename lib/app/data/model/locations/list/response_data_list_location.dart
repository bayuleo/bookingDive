import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseDataListLocation {

  const ResponseDataListLocation({
    required this.productId,
    required this.productName,
    required this.locationState,
    required this.locationCountry,
    required this.priceLower,
    required this.priceCurrency,
    required this.ratingCount,
    required this.ratingResult,
    required this.isWishlist,
    required this.image,
  });

  final int productId;
  final String productName;
  final String locationState;
  final String locationCountry;
  final String priceLower;
  final String priceCurrency;
  final int ratingCount;
  final int ratingResult;
  final bool isWishlist;
  final String image;

  factory ResponseDataListLocation.fromJson(Map<String,dynamic> json) => ResponseDataListLocation(
    productId: json['product_id'] as int,
    productName: json['product_name'].toString(),
    locationState: json['location_state'].toString(),
    locationCountry: json['location_country'].toString(),
    priceLower: json['price_lower'].toString(),
    priceCurrency: json['price_currency'].toString(),
    ratingCount: json['rating_count'] as int,
    ratingResult: json['rating_result'] as int,
    isWishlist: json['is_wishlist'] as bool,
    image: json['image'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'product_name': productName,
    'location_state': locationState,
    'location_country': locationCountry,
    'price_lower': priceLower,
    'price_currency': priceCurrency,
    'rating_count': ratingCount,
    'rating_result': ratingResult,
    'is_wishlist': isWishlist,
    'image': image
  };

  ResponseDataListLocation clone() => ResponseDataListLocation(
    productId: productId,
    productName: productName,
    locationState: locationState,
    locationCountry: locationCountry,
    priceLower: priceLower,
    priceCurrency: priceCurrency,
    ratingCount: ratingCount,
    ratingResult: ratingResult,
    isWishlist: isWishlist,
    image: image
  );


  ResponseDataListLocation copyWith({
    int? productId,
    String? productName,
    String? locationState,
    String? locationCountry,
    String? priceLower,
    String? priceCurrency,
    int? ratingCount,
    int? ratingResult,
    bool? isWishlist,
    String? image
  }) => ResponseDataListLocation(
    productId: productId ?? this.productId,
    productName: productName ?? this.productName,
    locationState: locationState ?? this.locationState,
    locationCountry: locationCountry ?? this.locationCountry,
    priceLower: priceLower ?? this.priceLower,
    priceCurrency: priceCurrency ?? this.priceCurrency,
    ratingCount: ratingCount ?? this.ratingCount,
    ratingResult: ratingResult ?? this.ratingResult,
    isWishlist: isWishlist ?? this.isWishlist,
    image: image ?? this.image,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDataListLocation && productId == other.productId && productName == other.productName && locationState == other.locationState && locationCountry == other.locationCountry && priceLower == other.priceLower && priceCurrency == other.priceCurrency && ratingCount == other.ratingCount && ratingResult == other.ratingResult && isWishlist == other.isWishlist && image == other.image;

  @override
  int get hashCode => productId.hashCode ^ productName.hashCode ^ locationState.hashCode ^ locationCountry.hashCode ^ priceLower.hashCode ^ priceCurrency.hashCode ^ ratingCount.hashCode ^ ratingResult.hashCode ^ isWishlist.hashCode ^ image.hashCode;
}
