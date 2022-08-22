import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestWishlist {

  const RequestWishlist({
    required this.listingId,
  });

  final String listingId;

  factory RequestWishlist.fromJson(Map<String,dynamic> json) => RequestWishlist(
    listingId: json['listing_id'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'listing_id': listingId
  };

  RequestWishlist clone() => RequestWishlist(
    listingId: listingId
  );


  RequestWishlist copyWith({
    String? listingId
  }) => RequestWishlist(
    listingId: listingId ?? this.listingId,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestWishlist && listingId == other.listingId;

  @override
  int get hashCode => listingId.hashCode;
}
