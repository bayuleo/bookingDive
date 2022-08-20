import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class RequestOrder {

  const RequestOrder({
    required this.packageId,
    required this.diveCenterId,
    required this.diverCount,
    required this.date,
    required this.ccNumber,
    required this.ccExpired,
    required this.ccCvc,
  });

  final String packageId;
  final String diveCenterId;
  final String diverCount;
  final String date;
  final String ccNumber;
  final String ccExpired;
  final String ccCvc;

  factory RequestOrder.fromJson(Map<String,dynamic> json) => RequestOrder(
    packageId: json['package_id'].toString(),
    diveCenterId: json['dive_center_id'].toString(),
    diverCount: json['diver_count'].toString(),
    date: json['date'].toString(),
    ccNumber: json['cc_number'].toString(),
    ccExpired: json['cc_expired'].toString(),
    ccCvc: json['cc_cvc'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'package_id': packageId,
    'dive_center_id': diveCenterId,
    'diver_count': diverCount,
    'date': date,
    'cc_number': ccNumber,
    'cc_expired': ccExpired,
    'cc_cvc': ccCvc
  };

  RequestOrder clone() => RequestOrder(
    packageId: packageId,
    diveCenterId: diveCenterId,
    diverCount: diverCount,
    date: date,
    ccNumber: ccNumber,
    ccExpired: ccExpired,
    ccCvc: ccCvc
  );


  RequestOrder copyWith({
    String? packageId,
    String? diveCenterId,
    String? diverCount,
    String? date,
    String? ccNumber,
    String? ccExpired,
    String? ccCvc
  }) => RequestOrder(
    packageId: packageId ?? this.packageId,
    diveCenterId: diveCenterId ?? this.diveCenterId,
    diverCount: diverCount ?? this.diverCount,
    date: date ?? this.date,
    ccNumber: ccNumber ?? this.ccNumber,
    ccExpired: ccExpired ?? this.ccExpired,
    ccCvc: ccCvc ?? this.ccCvc,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestOrder && packageId == other.packageId && diveCenterId == other.diveCenterId && diverCount == other.diverCount && date == other.date && ccNumber == other.ccNumber && ccExpired == other.ccExpired && ccCvc == other.ccCvc;

  @override
  int get hashCode => packageId.hashCode ^ diveCenterId.hashCode ^ diverCount.hashCode ^ date.hashCode ^ ccNumber.hashCode ^ ccExpired.hashCode ^ ccCvc.hashCode;
}
