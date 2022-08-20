import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseOrderData {

  const ResponseOrderData({
    required this.orderId,
    required this.tempUserId,
  });

  final String orderId;
  final String tempUserId;

  factory ResponseOrderData.fromJson(Map<String,dynamic> json) => ResponseOrderData(
    orderId: json['order_id'].toString(),
    tempUserId: json['temp_user_id'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'order_id': orderId,
    'temp_user_id': tempUserId
  };

  ResponseOrderData clone() => ResponseOrderData(
    orderId: orderId,
    tempUserId: tempUserId
  );


  ResponseOrderData copyWith({
    String? orderId,
    String? tempUserId
  }) => ResponseOrderData(
    orderId: orderId ?? this.orderId,
    tempUserId: tempUserId ?? this.tempUserId,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseOrderData && orderId == other.orderId && tempUserId == other.tempUserId;

  @override
  int get hashCode => orderId.hashCode ^ tempUserId.hashCode;
}
