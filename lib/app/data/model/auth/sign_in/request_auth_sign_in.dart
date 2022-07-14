import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestAuthSignIn {

  const RequestAuthSignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory RequestAuthSignIn.fromJson(Map<String,dynamic> json) => RequestAuthSignIn(
    email: json['email'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };

  RequestAuthSignIn clone() => RequestAuthSignIn(
    email: email,
    password: password
  );


  RequestAuthSignIn copyWith({
    String? email,
    String? password
  }) => RequestAuthSignIn(
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestAuthSignIn && email == other.email && password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
