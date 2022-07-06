import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseForgotPasswordData {

  const ResponseForgotPasswordData({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;

  factory ResponseForgotPasswordData.fromJson(Map<String,dynamic> json) => ResponseForgotPasswordData(
    token: json['token'].toString(),
    refreshToken: json['refreshToken'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'token': token,
    'refreshToken': refreshToken
  };

  ResponseForgotPasswordData clone() => ResponseForgotPasswordData(
    token: token,
    refreshToken: refreshToken
  );


  ResponseForgotPasswordData copyWith({
    String? token,
    String? refreshToken
  }) => ResponseForgotPasswordData(
    token: token ?? this.token,
    refreshToken: refreshToken ?? this.refreshToken,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseForgotPasswordData && token == other.token && refreshToken == other.refreshToken;

  @override
  int get hashCode => token.hashCode ^ refreshToken.hashCode;
}
