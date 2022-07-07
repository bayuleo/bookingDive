import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthSignIn {

  const ResponseAuthSignIn({
    required this.message,
    this.error,
    required this.datas,
    required this.id,
  });

  final String message;
  final String? error;
  final ResponseAuthSignInData datas;
  final String id;

  factory ResponseAuthSignIn.fromJson(Map<String,dynamic> json) => ResponseAuthSignIn(
    message: json['message'].toString(),
    error: json['error']?.toString(),
    datas: ResponseAuthSignInData.fromJson(json['datas'] as Map<String, dynamic>),
    id: json['id'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message,
    'error': error,
    'datas': datas.toJson(),
    'id': id
  };

  ResponseAuthSignIn clone() => ResponseAuthSignIn(
    message: message,
    error: error,
    datas: datas.clone(),
    id: id
  );


  ResponseAuthSignIn copyWith({
    String? message,
    Optional<String?>? error,
    ResponseAuthSignInData? datas,
    String? id
  }) => ResponseAuthSignIn(
    message: message ?? this.message,
    error: checkOptional(error, () => this.error),
    datas: datas ?? this.datas,
    id: id ?? this.id,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthSignIn && message == other.message && error == other.error && datas == other.datas && id == other.id;

  @override
  int get hashCode => message.hashCode ^ error.hashCode ^ datas.hashCode ^ id.hashCode;
}
