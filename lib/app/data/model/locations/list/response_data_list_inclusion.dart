import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseDataListInclusion {

  const ResponseDataListInclusion({
    required this.name,
  });

  final String name;

  factory ResponseDataListInclusion.fromJson(Map<String,dynamic> json) => ResponseDataListInclusion(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  ResponseDataListInclusion clone() => ResponseDataListInclusion(
    name: name
  );


  ResponseDataListInclusion copyWith({
    String? name
  }) => ResponseDataListInclusion(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDataListInclusion && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
