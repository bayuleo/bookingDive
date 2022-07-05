import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseRegister {

  const ResponseRegister({
    required this.message,
    required this.data,
  });

  final Message message;
  final ResponseRegisterData data;

  factory ResponseRegister.fromJson(Map<String,dynamic> json) => ResponseRegister(
    message: Message.fromJson(json['message'] as Map<String, dynamic>),
    data: ResponseRegisterData.fromJson(json['data'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'message': message.toJson(),
    'data': data.toJson()
  };

  ResponseRegister clone() => ResponseRegister(
    message: message.clone(),
    data: data.clone()
  );


  ResponseRegister copyWith({
    Message? message,
    ResponseRegisterData? data
  }) => ResponseRegister(
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseRegister && message == other.message && data == other.data;

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}
