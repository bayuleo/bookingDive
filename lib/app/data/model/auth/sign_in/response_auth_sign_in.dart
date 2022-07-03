import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthSignIn {

  const ResponseAuthSignIn({
    required this.message,
    required this.data,
  });

  final Message message;
  final ResponseAuthSignInData data;

  factory ResponseAuthSignIn.fromJson(Map<String,dynamic> json) => ResponseAuthSignIn(
    message: Message.fromJson(json['message'] as Map<String, dynamic>),
    data: ResponseAuthSignInData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'message': message.toJson(),
    'data': data.toJson()
  };

  ResponseAuthSignIn clone() => ResponseAuthSignIn(
    message: message.clone(),
    data: data.clone()
  );


  ResponseAuthSignIn copyWith({
    Message? message,
    ResponseAuthSignInData? data
  }) => ResponseAuthSignIn(
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthSignIn && message == other.message && data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
