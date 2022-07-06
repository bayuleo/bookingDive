import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseForgotPassword {

  const ResponseForgotPassword({
    required this.message,
    required this.data,
  });

  final Message message;
  final ResponseForgotPasswordData data;

  factory ResponseForgotPassword.fromJson(Map<String,dynamic> json) => ResponseForgotPassword(
    message: Message.fromJson(json['message'] as Map<String, dynamic>),
    data: ResponseForgotPasswordData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'message': message.toJson(),
    'data': data.toJson()
  };

  ResponseForgotPassword clone() => ResponseForgotPassword(
    message: message.clone(),
    data: data.clone()
  );


  ResponseForgotPassword copyWith({
    Message? message,
    ResponseForgotPasswordData? data
  }) => ResponseForgotPassword(
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseForgotPassword && message == other.message && data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
