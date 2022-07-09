import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseSpot {

  const ResponseSpot({
    required this.message,
    required this.data,
  });

  final String message;
  final List<ResponseDataSpot> data;

  factory ResponseSpot.fromJson(Map<String,dynamic> json) => ResponseSpot(
    message: json['message'].toString(),
    data: (json['data'] as List? ?? []).map((e) => ResponseDataSpot.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data.map((e) => e.toJson()).toList()
  };

  ResponseSpot clone() => ResponseSpot(
    message: message,
    data: data.map((e) => e.clone()).toList()
  );


  ResponseSpot copyWith({
    String? message,
    List<ResponseDataSpot>? data
  }) => ResponseSpot(
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSpot && message == other.message && data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
