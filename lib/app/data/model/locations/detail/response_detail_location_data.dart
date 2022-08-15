import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseDetailLocationData {

  const ResponseDetailLocationData({
    required this.productId,
    required this.productName,
    required this.locationState,
    required this.locationCountry,
    required this.priceLower,
    required this.priceCurrency,
    required this.ratingCount,
    required this.ratingResult,
    this.isWishlist,
    this.images,
    required this.packages,
    required this.lat,
    required this.lng,
    required this.formattedLocation,
    required this.description,
    required this.video,
    required this.hostId,
    required this.hostname,
    required this.hostSince,
  });

  final String productId;
  final String productName;
  final String locationState;
  final String locationCountry;
  final String priceLower;
  final String priceCurrency;
  final int ratingCount;
  final int ratingResult;
  final bool? isWishlist;
  final List<String>? images;
  final List<ResponseDetailLocationPackages> packages;
  final String lat;
  final String lng;
  final String formattedLocation;
  final ResponseDetailLocationDescription description;
  final String video;
  final String hostId;
  final String hostname;
  final String hostSince;

  factory ResponseDetailLocationData.fromJson(Map<String,dynamic> json) => ResponseDetailLocationData(
    productId: json['product_id'].toString(),
    productName: json['product_name'].toString(),
    locationState: json['location_state'].toString(),
    locationCountry: json['location_country'].toString(),
    priceLower: json['price_lower'].toString(),
    priceCurrency: json['price_currency'].toString(),
    ratingCount: json['rating_count'] as int,
    ratingResult: json['rating_result'] as int,
    isWishlist: json['is_wishlist'] != null ? json['is_wishlist'] as bool : null,
    images: json['images'] != null ? (json['images'] as List? ?? []).map((e) => e as String).toList() : null,
    packages: (json['packages'] as List? ?? []).map((e) => ResponseDetailLocationPackages.fromJson(e as Map<String, dynamic>)).toList(),
    lat: json['lat'].toString(),
    lng: json['lng'].toString(),
    formattedLocation: json['formatted_location'].toString(),
    description: ResponseDetailLocationDescription.fromJson(json['description'] as Map<String, dynamic>),
    video: json['video'].toString(),
    hostId: json['host_id'].toString(),
    hostname: json['hostname'].toString(),
    hostSince: json['host_since'].toString()
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
    'images': images?.map((e) => e.toString()).toList(),
    'packages': packages.map((e) => e.toJson()).toList(),
    'lat': lat,
    'lng': lng,
    'formatted_location': formattedLocation,
    'description': description.toJson(),
    'video': video,
    'host_id': hostId,
    'hostname': hostname,
    'host_since': hostSince
  };

  ResponseDetailLocationData clone() => ResponseDetailLocationData(
    productId: productId,
    productName: productName,
    locationState: locationState,
    locationCountry: locationCountry,
    priceLower: priceLower,
    priceCurrency: priceCurrency,
    ratingCount: ratingCount,
    ratingResult: ratingResult,
    isWishlist: isWishlist,
    images: images?.toList(),
    packages: packages.map((e) => e.clone()).toList(),
    lat: lat,
    lng: lng,
    formattedLocation: formattedLocation,
    description: description.clone(),
    video: video,
    hostId: hostId,
    hostname: hostname,
    hostSince: hostSince
  );


  ResponseDetailLocationData copyWith({
    String? productId,
    String? productName,
    String? locationState,
    String? locationCountry,
    String? priceLower,
    String? priceCurrency,
    int? ratingCount,
    int? ratingResult,
    Optional<bool?>? isWishlist,
    Optional<List<String>?>? images,
    List<ResponseDetailLocationPackages>? packages,
    String? lat,
    String? lng,
    String? formattedLocation,
    ResponseDetailLocationDescription? description,
    String? video,
    String? hostId,
    String? hostname,
    String? hostSince
  }) => ResponseDetailLocationData(
    productId: productId ?? this.productId,
    productName: productName ?? this.productName,
    locationState: locationState ?? this.locationState,
    locationCountry: locationCountry ?? this.locationCountry,
    priceLower: priceLower ?? this.priceLower,
    priceCurrency: priceCurrency ?? this.priceCurrency,
    ratingCount: ratingCount ?? this.ratingCount,
    ratingResult: ratingResult ?? this.ratingResult,
    isWishlist: checkOptional(isWishlist, () => this.isWishlist),
    images: checkOptional(images, () => this.images),
    packages: packages ?? this.packages,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    formattedLocation: formattedLocation ?? this.formattedLocation,
    description: description ?? this.description,
    video: video ?? this.video,
    hostId: hostId ?? this.hostId,
    hostname: hostname ?? this.hostname,
    hostSince: hostSince ?? this.hostSince,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailLocationData && productId == other.productId && productName == other.productName && locationState == other.locationState && locationCountry == other.locationCountry && priceLower == other.priceLower && priceCurrency == other.priceCurrency && ratingCount == other.ratingCount && ratingResult == other.ratingResult && isWishlist == other.isWishlist && images == other.images && packages == other.packages && lat == other.lat && lng == other.lng && formattedLocation == other.formattedLocation && description == other.description && video == other.video && hostId == other.hostId && hostname == other.hostname && hostSince == other.hostSince;

  @override
  int get hashCode => productId.hashCode ^ productName.hashCode ^ locationState.hashCode ^ locationCountry.hashCode ^ priceLower.hashCode ^ priceCurrency.hashCode ^ ratingCount.hashCode ^ ratingResult.hashCode ^ isWishlist.hashCode ^ images.hashCode ^ packages.hashCode ^ lat.hashCode ^ lng.hashCode ^ formattedLocation.hashCode ^ description.hashCode ^ video.hashCode ^ hostId.hashCode ^ hostname.hashCode ^ hostSince.hashCode;
}
