import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestAuthSignIn {

  const RequestAuthSignIn({
    required this.username,
    required this.password,
    required this.rememberMe,
  });

  final String username;
  final String password;
  final bool rememberMe;

  factory RequestAuthSignIn.fromJson(Map<String,dynamic> json) => RequestAuthSignIn(
    username: json['username'].toString(),
    password: json['password'].toString(),
    rememberMe: json['rememberMe'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'rememberMe': rememberMe
  };

  RequestAuthSignIn clone() => RequestAuthSignIn(
    username: username,
    password: password,
    rememberMe: rememberMe
  );


  RequestAuthSignIn copyWith({
    String? username,
    String? password,
    bool? rememberMe
  }) => RequestAuthSignIn(
    username: username ?? this.username,
    password: password ?? this.password,
    rememberMe: rememberMe ?? this.rememberMe,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestAuthSignIn && username == other.username && password == other.password && rememberMe == other.rememberMe;

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ rememberMe.hashCode;
}
