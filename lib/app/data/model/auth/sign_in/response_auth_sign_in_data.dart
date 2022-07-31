import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseAuthSignInData {

  const ResponseAuthSignInData({
    required this.accessToken,
    required this.refreshToken,
    required this.profile,
  });

  final String accessToken;
  final String refreshToken;
  final ResponseProfileData profile;

  factory ResponseAuthSignInData.fromJson(Map<String,dynamic> json) => ResponseAuthSignInData(
    accessToken: json['access_token'].toString(),
    refreshToken: json['refresh_token'].toString(),
    profile: ResponseProfileData.fromJson(json['profile'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'profile': profile.toJson()
  };

  ResponseAuthSignInData clone() => ResponseAuthSignInData(
    accessToken: accessToken,
    refreshToken: refreshToken,
    profile: profile.clone()
  );


  ResponseAuthSignInData copyWith({
    String? accessToken,
    String? refreshToken,
    ResponseProfileData? profile
  }) => ResponseAuthSignInData(
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
    profile: profile ?? this.profile,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAuthSignInData && accessToken == other.accessToken && refreshToken == other.refreshToken && profile == other.profile;

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode ^ profile.hashCode;
}
