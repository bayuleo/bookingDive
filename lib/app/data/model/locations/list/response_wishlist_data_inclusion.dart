import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseWishlistDataInclusion {

  const ResponseWishlistDataInclusion({
    required this.name,
  });

  final String name;

  factory ResponseWishlistDataInclusion.fromJson(Map<String,dynamic> json) => ResponseWishlistDataInclusion(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  ResponseWishlistDataInclusion clone() => ResponseWishlistDataInclusion(
    name: name
  );


  ResponseWishlistDataInclusion copyWith({
    String? name
  }) => ResponseWishlistDataInclusion(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseWishlistDataInclusion && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
