import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseWishlistDataExclusion {

  const ResponseWishlistDataExclusion({
    required this.name,
  });

  final String name;

  factory ResponseWishlistDataExclusion.fromJson(Map<String,dynamic> json) => ResponseWishlistDataExclusion(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  ResponseWishlistDataExclusion clone() => ResponseWishlistDataExclusion(
    name: name
  );


  ResponseWishlistDataExclusion copyWith({
    String? name
  }) => ResponseWishlistDataExclusion(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseWishlistDataExclusion && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
