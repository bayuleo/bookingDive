import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseRegisterData {

  const ResponseRegisterData({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;

  factory ResponseRegisterData.fromJson(Map<String,dynamic> json) => ResponseRegisterData(
    token: json['token'].toString(),
    refreshToken: json['refreshToken'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'token': token,
    'refreshToken': refreshToken
  };

  ResponseRegisterData clone() => ResponseRegisterData(
    token: token,
    refreshToken: refreshToken
  );


  ResponseRegisterData copyWith({
    String? token,
    String? refreshToken
  }) => ResponseRegisterData(
    token: token ?? this.token,
    refreshToken: refreshToken ?? this.refreshToken,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseRegisterData && token == other.token && refreshToken == other.refreshToken;

  @override
  int get hashCode => token.hashCode ^ refreshToken.hashCode;
}
