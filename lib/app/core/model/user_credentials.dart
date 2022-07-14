import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../data/model/auth/sign_in/response_auth_sign_in_data_profile.dart';
import '../utils/check_optional.dart';

@immutable
class UserCredentials {
  const UserCredentials(
      {
      // required this.isFirstLaunch,
      this.refreshToken,
      this.accessToken,
      this.profile});

  final String? refreshToken;
  final String? accessToken;
  final ResponseAuthSignInDataProfile? profile;

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      UserCredentials(
        refreshToken: json['refresh_token']?.toString(),
        accessToken: json['access_token']?.toString(),
        profile: json['profile'] != null
            ? ResponseAuthSignInDataProfile.fromJson(
                json['profile'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        // 'isFirstLaunch': isFirstLaunch,
        'refresh_token': refreshToken,
        'access_token': accessToken,
        'profile': profile?.toJson()
      };

  UserCredentials clone() => UserCredentials(
      refreshToken: refreshToken,
      accessToken: accessToken,
      profile: profile?.clone());

  UserCredentials copyWith(
          {Optional<String?>? refreshToken,
          Optional<String?>? accessToken,
          Optional<ResponseAuthSignInDataProfile?>? profile}) =>
      UserCredentials(
          refreshToken: checkOptional(refreshToken, () => this.refreshToken),
          accessToken: checkOptional(accessToken, () => this.accessToken),
          profile: checkOptional(profile, () => this.profile));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentials &&
          // isFirstLaunch == other.isFirstLaunch &&
          refreshToken == other.refreshToken &&
          accessToken == other.accessToken &&
          profile == other.profile;

  @override
  int get hashCode =>
      // isFirstLaunch.hashCode ^
      refreshToken.hashCode ^ accessToken.hashCode ^ profile.hashCode;
}
