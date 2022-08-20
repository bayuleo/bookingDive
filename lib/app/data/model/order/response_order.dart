import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseOrder {

  const ResponseOrder({
    this.status,
    required this.message,
    this.error,
    required this.data,
  });

  final bool? status;
  final String message;
  final Error? error;
  final ResponseOrderData data;

  factory ResponseOrder.fromJson(Map<String,dynamic> json) => ResponseOrder(
    status: json['status'] != null ? json['status'] as bool : null,
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    data: ResponseOrderData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'error': error?.toJson(),
    'data': data.toJson()
  };

  ResponseOrder clone() => ResponseOrder(
    status: status,
    message: message,
    error: error?.clone(),
    data: data.clone()
  );


  ResponseOrder copyWith({
    Optional<bool?>? status,
    String? message,
    Optional<Error?>? error,
    ResponseOrderData? data
  }) => ResponseOrder(
    status: checkOptional(status, () => this.status),
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseOrder && status == other.status && message == other.message && error == other.error && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ error.hashCode ^ data.hashCode;
}
