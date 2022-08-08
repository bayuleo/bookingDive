import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseCitiesList {

  const ResponseCitiesList({
    required this.message,
    this.error,
    this.status,
    required this.data,
  });

  final String message;
  final Error? error;
  final bool? status;
  final List<ResponseCitiesListData> data;

  factory ResponseCitiesList.fromJson(Map<String,dynamic> json) => ResponseCitiesList(
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    status: json['status'] != null ? json['status'] as bool : null,
    data: (json['data'] as List? ?? []).map((e) => ResponseCitiesListData.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'error': error?.toJson(),
    'status': status,
    'data': data.map((e) => e.toJson()).toList()
  };

  ResponseCitiesList clone() => ResponseCitiesList(
    message: message,
    error: error?.clone(),
    status: status,
    data: data.map((e) => e.clone()).toList()
  );


  ResponseCitiesList copyWith({
    String? message,
    Optional<Error?>? error,
    Optional<bool?>? status,
    List<ResponseCitiesListData>? data
  }) => ResponseCitiesList(
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    status: checkOptional(status, () => this.status),
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCitiesList && message == other.message && error == other.error && status == other.status && data == other.data;

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ status.hashCode ^ data.hashCode;
}
