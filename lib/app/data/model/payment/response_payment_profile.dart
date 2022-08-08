import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponsePaymentProfile {

  const ResponsePaymentProfile({
    required this.message,
    this.error,
    this.status,
    required this.data,
  });

  final String message;
  final Error? error;
  final bool? status;
  final ResponsePaymentProfileData data;

  factory ResponsePaymentProfile.fromJson(Map<String,dynamic> json) => ResponsePaymentProfile(
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    status: json['status'] != null ? json['status'] as bool : null,
    data: ResponsePaymentProfileData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'error': error?.toJson(),
    'status': status,
    'data': data.toJson()
  };

  ResponsePaymentProfile clone() => ResponsePaymentProfile(
    message: message,
    error: error?.clone(),
    status: status,
    data: data.clone()
  );


  ResponsePaymentProfile copyWith({
    String? message,
    Optional<Error?>? error,
    Optional<bool?>? status,
    ResponsePaymentProfileData? data
  }) => ResponsePaymentProfile(
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    status: checkOptional(status, () => this.status),
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponsePaymentProfile && message == other.message && error == other.error && status == other.status && data == other.data;

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ status.hashCode ^ data.hashCode;
}
