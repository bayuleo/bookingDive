import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthLogout {

  const ResponseAuthLogout({
    required this.message,
    this.error,
    required this.status,
    required this.data,
  });

  final String message;
  final Error? error;
  final bool status;
  final ResponseAuthLogoutData data;

  factory ResponseAuthLogout.fromJson(Map<String,dynamic> json) => ResponseAuthLogout(
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    status: json['status'] as bool,
    data: ResponseAuthLogoutData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'error': error?.toJson(),
    'status': status,
    'data': data.toJson()
  };

  ResponseAuthLogout clone() => ResponseAuthLogout(
    message: message,
    error: error?.clone(),
    status: status,
    data: data.clone()
  );


  ResponseAuthLogout copyWith({
    String? message,
    Optional<Error?>? error,
    bool? status,
    ResponseAuthLogoutData? data
  }) => ResponseAuthLogout(
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    status: status ?? this.status,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthLogout && message == other.message && error == other.error && status == other.status && data == other.data;

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ status.hashCode ^ data.hashCode;
}
