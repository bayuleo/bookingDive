import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseListLocation {

  const ResponseListLocation({
    required this.status,
    required this.message,
    this.error,
    required this.data,
  });

  final bool status;
  final String message;
  final Error? error;
  final List<ResponseDataListLocation> data;

  factory ResponseListLocation.fromJson(Map<String,dynamic> json) => ResponseListLocation(
    status: json['status'] as bool,
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    data: (json['data'] as List? ?? []).map((e) => ResponseDataListLocation.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'error': error?.toJson(),
    'data': data.map((e) => e.toJson()).toList()
  };

  ResponseListLocation clone() => ResponseListLocation(
    status: status,
    message: message,
    error: error?.clone(),
    data: data.map((e) => e.clone()).toList()
  );


  ResponseListLocation copyWith({
    bool? status,
    String? message,
    Optional<Error?>? error,
    List<ResponseDataListLocation>? data
  }) => ResponseListLocation(
    status: status ?? this.status,
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseListLocation && status == other.status && message == other.message && error == other.error && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ error.hashCode ^ data.hashCode;
}
