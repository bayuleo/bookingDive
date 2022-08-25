import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseListOrderData {

  const ResponseListOrderData({
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.locationState,
    required this.locationCountry,
    required this.grandTotal,
    required this.paymentStatus,
    required this.isCompleted,
    required this.package,
  });

  final String orderId;
  final String productId;
  final String productName;
  final String locationState;
  final String locationCountry;
  final String grandTotal;
  final String paymentStatus;
  final bool isCompleted;
  final ResponseListOrderPackage package;

  factory ResponseListOrderData.fromJson(Map<String,dynamic> json) => ResponseListOrderData(
    orderId: json['order_id'].toString(),
    productId: json['product_id'].toString(),
    productName: json['product_name'].toString(),
    locationState: json['location_state'].toString(),
    locationCountry: json['location_country'].toString(),
    grandTotal: json['grand_total'].toString(),
    paymentStatus: json['payment_status'].toString(),
    isCompleted: json['is_completed'] as bool,
    package: ResponseListOrderPackage.fromJson(json['package'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'order_id': orderId,
    'product_id': productId,
    'product_name': productName,
    'location_state': locationState,
    'location_country': locationCountry,
    'grand_total': grandTotal,
    'payment_status': paymentStatus,
    'is_completed': isCompleted,
    'package': package.toJson()
  };

  ResponseListOrderData clone() => ResponseListOrderData(
    orderId: orderId,
    productId: productId,
    productName: productName,
    locationState: locationState,
    locationCountry: locationCountry,
    grandTotal: grandTotal,
    paymentStatus: paymentStatus,
    isCompleted: isCompleted,
    package: package.clone()
  );


  ResponseListOrderData copyWith({
    String? orderId,
    String? productId,
    String? productName,
    String? locationState,
    String? locationCountry,
    String? grandTotal,
    String? paymentStatus,
    bool? isCompleted,
    ResponseListOrderPackage? package
  }) => ResponseListOrderData(
    orderId: orderId ?? this.orderId,
    productId: productId ?? this.productId,
    productName: productName ?? this.productName,
    locationState: locationState ?? this.locationState,
    locationCountry: locationCountry ?? this.locationCountry,
    grandTotal: grandTotal ?? this.grandTotal,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    isCompleted: isCompleted ?? this.isCompleted,
    package: package ?? this.package,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseListOrderData && orderId == other.orderId && productId == other.productId && productName == other.productName && locationState == other.locationState && locationCountry == other.locationCountry && grandTotal == other.grandTotal && paymentStatus == other.paymentStatus && isCompleted == other.isCompleted && package == other.package;

  @override
  int get hashCode => orderId.hashCode ^ productId.hashCode ^ productName.hashCode ^ locationState.hashCode ^ locationCountry.hashCode ^ grandTotal.hashCode ^ paymentStatus.hashCode ^ isCompleted.hashCode ^ package.hashCode;
}
