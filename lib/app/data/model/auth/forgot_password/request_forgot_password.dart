import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestForgotPassword {

  const RequestForgotPassword({
    required this.email,
  });

  final String email;

  factory RequestForgotPassword.fromJson(Map<String,dynamic> json) => RequestForgotPassword(
    email: json['email'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'email': email
  };

  RequestForgotPassword clone() => RequestForgotPassword(
    email: email
  );


  RequestForgotPassword copyWith({
    String? email
  }) => RequestForgotPassword(
    email: email ?? this.email,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestForgotPassword && email == other.email;

  @override
  int get hashCode => email.hashCode;
}
