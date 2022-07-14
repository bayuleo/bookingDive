import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthSignIn {

  const ResponseAuthSignIn({
    required this.message,
    this.error,
    required this.status,
    required this.data,
  });

  final String message;
  final Error? error;
  final bool status;
  final ResponseAuthSignInData data;

  factory ResponseAuthSignIn.fromJson(Map<String,dynamic> json) => ResponseAuthSignIn(
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    status: json['status'] as bool,
    data: ResponseAuthSignInData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'error': error?.toJson(),
    'status': status,
    'data': data.toJson()
  };

  ResponseAuthSignIn clone() => ResponseAuthSignIn(
    message: message,
    error: error?.clone(),
    status: status,
    data: data.clone()
  );


  ResponseAuthSignIn copyWith({
    String? message,
    Optional<Error?>? error,
    bool? status,
    ResponseAuthSignInData? data
  }) => ResponseAuthSignIn(
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    status: status ?? this.status,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthSignIn && message == other.message && error == other.error && status == other.status && data == other.data;

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ status.hashCode ^ data.hashCode;
}
