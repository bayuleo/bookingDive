import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../utils/check_optional.dart';

@immutable
class UserCredentials {
  const UserCredentials({
    required this.isFirstLaunch,
    this.refreshToken,
    this.accessToken,
    this.username,
  });

  final bool isFirstLaunch;
  final String? refreshToken;
  final String? accessToken;
  final String? username;

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      UserCredentials(
        isFirstLaunch: json['isFirstLaunch'] as bool,
        refreshToken: json['refreshToken']?.toString(),
        accessToken: json['accessToken']?.toString(),
        username: json['username']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'isFirstLaunch': isFirstLaunch,
        'refreshToken': refreshToken,
        'accessToken': accessToken,
        'username': username,
      };

  UserCredentials clone() => UserCredentials(
        isFirstLaunch: isFirstLaunch,
        refreshToken: refreshToken,
        accessToken: accessToken,
        username: username,
      );

  UserCredentials copyWith({
    bool? isFirstLaunch,
    Optional<String?>? refreshToken,
    Optional<String?>? accessToken,
    Optional<String?>? username,
  }) =>
      UserCredentials(
        isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
        refreshToken: checkOptional(refreshToken, () => this.refreshToken),
        accessToken: checkOptional(accessToken, () => this.accessToken),
        username: checkOptional(username, () => this.username),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentials &&
          isFirstLaunch == other.isFirstLaunch &&
          refreshToken == other.refreshToken &&
          accessToken == other.accessToken &&
          username == other.username;

  @override
  int get hashCode =>
      isFirstLaunch.hashCode ^
      refreshToken.hashCode ^
      accessToken.hashCode ^
      username.hashCode;
}
