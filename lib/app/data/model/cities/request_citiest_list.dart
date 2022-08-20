import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class RequestCitiestList {

  const RequestCitiestList({
    required this.keyword,
  });

  final String keyword;

  factory RequestCitiestList.fromJson(Map<String,dynamic> json) => RequestCitiestList(
    keyword: json['keyword'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'keyword': keyword
  };

  RequestCitiestList clone() => RequestCitiestList(
    keyword: keyword
  );


  RequestCitiestList copyWith({
    String? keyword
  }) => RequestCitiestList(
    keyword: keyword ?? this.keyword,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestCitiestList && keyword == other.keyword;

  @override
  int get hashCode => keyword.hashCode;
}
