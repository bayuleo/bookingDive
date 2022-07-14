import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestRegister {

  const RequestRegister({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  factory RequestRegister.fromJson(Map<String,dynamic> json) => RequestRegister(
    firstName: json['first_name'].toString(),
    lastName: json['last_name'].toString(),
    email: json['email'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'password': password
  };

  RequestRegister clone() => RequestRegister(
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password
  );


  RequestRegister copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password
  }) => RequestRegister(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestRegister && firstName == other.firstName && lastName == other.lastName && email == other.email && password == other.password;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ password.hashCode;
}
