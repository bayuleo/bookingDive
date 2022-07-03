import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthSignInData {

  const ResponseAuthSignInData({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;

  factory ResponseAuthSignInData.fromJson(Map<String,dynamic> json) => ResponseAuthSignInData(
    token: json['token'].toString(),
    refreshToken: json['refreshToken'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'token': token,
    'refreshToken': refreshToken
  };

  ResponseAuthSignInData clone() => ResponseAuthSignInData(
    token: token,
    refreshToken: refreshToken
  );


  ResponseAuthSignInData copyWith({
    String? token,
    String? refreshToken
  }) => ResponseAuthSignInData(
    token: token ?? this.token,
    refreshToken: refreshToken ?? this.refreshToken,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthSignInData && token == other.token && refreshToken == other.refreshToken;

  @override
  int get hashCode => token.hashCode ^ refreshToken.hashCode;
}
