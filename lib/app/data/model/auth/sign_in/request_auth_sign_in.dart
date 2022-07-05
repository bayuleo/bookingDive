import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestAuthSignIn {

  const RequestAuthSignIn({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory RequestAuthSignIn.fromJson(Map<String,dynamic> json) => RequestAuthSignIn(
    username: json['username'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password
  };

  RequestAuthSignIn clone() => RequestAuthSignIn(
    username: username,
    password: password
  );


  RequestAuthSignIn copyWith({
    String? username,
    String? password
  }) => RequestAuthSignIn(
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestAuthSignIn && username == other.username && password == other.password;

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
