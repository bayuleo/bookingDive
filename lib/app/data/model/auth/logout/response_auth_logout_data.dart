import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthLogoutData {

  const ResponseAuthLogoutData({
    required this.message,
  });

  final String message;

  factory ResponseAuthLogoutData.fromJson(Map<String,dynamic> json) => ResponseAuthLogoutData(
    message: json['message'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message
  };

  ResponseAuthLogoutData clone() => ResponseAuthLogoutData(
    message: message
  );


  ResponseAuthLogoutData copyWith({
    String? message
  }) => ResponseAuthLogoutData(
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthLogoutData && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
