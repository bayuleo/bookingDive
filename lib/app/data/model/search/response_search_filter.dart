import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseSearchFilter {

  const ResponseSearchFilter({
    required this.message,
    required this.data,
  });

  final String message;
  final List<ResponseSearchFilterData> data;

  factory ResponseSearchFilter.fromJson(Map<String,dynamic> json) => ResponseSearchFilter(
    message: json['message'].toString(),
    data: (json['data'] as List? ?? []).map((e) => ResponseSearchFilterData.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data.map((e) => e.toJson()).toList()
  };

  ResponseSearchFilter clone() => ResponseSearchFilter(
    message: message,
    data: data.map((e) => e.clone()).toList()
  );


  ResponseSearchFilter copyWith({
    String? message,
    List<ResponseSearchFilterData>? data
  }) => ResponseSearchFilter(
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSearchFilter && message == other.message && data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
