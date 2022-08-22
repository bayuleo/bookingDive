import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseWishlist {

  const ResponseWishlist({
    this.status,
    required this.message,
    this.error,
    this.data,
  });

  final bool? status;
  final String message;
  final Error? error;
  final List<ResponseWishlistData>? data;

  factory ResponseWishlist.fromJson(Map<String,dynamic> json) => ResponseWishlist(
    status: json['status'] != null ? json['status'] as bool : null,
    message: json['message'].toString(),
    error: json['error'] != null ? Error.fromJson(json['error'] as Map<String, dynamic>) : null,
    data: json['data'] != null ? (json['data'] as List? ?? []).map((e) => ResponseWishlistData.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'error': error?.toJson(),
    'data': data?.map((e) => e.toJson()).toList()
  };

  ResponseWishlist clone() => ResponseWishlist(
    status: status,
    message: message,
    error: error?.clone(),
    data: data?.map((e) => e.clone()).toList()
  );


  ResponseWishlist copyWith({
    Optional<bool?>? status,
    String? message,
    Optional<Error?>? error,
    Optional<List<ResponseWishlistData>?>? data
  }) => ResponseWishlist(
    status: checkOptional(status, () => this.status),
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    data: checkOptional(data, () => this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseWishlist && status == other.status && message == other.message && error == other.error && data == other.data;

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ error.hashCode ^ data.hashCode;
}
