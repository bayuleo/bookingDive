import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponsePopularDiving {

  const ResponsePopularDiving({
    required this.status,
    required this.message,
    this.error,
    required this.data,
  });

  final bool status;
  final String message;
  final Error? error;
  final List<ResponseDataPopularDiving> data;

  factory ResponsePopularDiving.fromJson(Map<String,dynamic> json) => ResponsePopularDiving(
    status: json['status'] as bool,
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    data: (json['data'] as List? ?? []).map((e) => ResponseDataPopularDiving.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'error': error?.toJson(),
    'data': data.map((e) => e.toJson()).toList()
  };

  ResponsePopularDiving clone() => ResponsePopularDiving(
    status: status,
    message: message,
    error: error?.clone(),
    data: data.map((e) => e.clone()).toList()
  );


  ResponsePopularDiving copyWith({
    bool? status,
    String? message,
    Optional<Error?>? error,
    List<ResponseDataPopularDiving>? data
  }) => ResponsePopularDiving(
    status: status ?? this.status,
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponsePopularDiving && status == other.status && message == other.message && error == other.error && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ error.hashCode ^ data.hashCode;
}
