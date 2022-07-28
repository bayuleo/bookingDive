import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseDetailLocation {

  const ResponseDetailLocation({
    required this.status,
    required this.message,
    this.error,
    required this.data,
  });

  final bool status;
  final String message;
  final Error? error;
  final ResponseDetailLocationData data;

  factory ResponseDetailLocation.fromJson(Map<String,dynamic> json) => ResponseDetailLocation(
    status: json['status'] as bool,
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    data: ResponseDetailLocationData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'error': error?.toJson(),
    'data': data.toJson()
  };

  ResponseDetailLocation clone() => ResponseDetailLocation(
    status: status,
    message: message,
    error: error?.clone(),
    data: data.clone()
  );


  ResponseDetailLocation copyWith({
    bool? status,
    String? message,
    Optional<Error?>? error,
    ResponseDetailLocationData? data
  }) => ResponseDetailLocation(
    status: status ?? this.status,
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailLocation && status == other.status && message == other.message && error == other.error && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ error.hashCode ^ data.hashCode;
}
