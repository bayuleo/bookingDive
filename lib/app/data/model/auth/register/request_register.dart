import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestRegister {

  const RequestRegister({
    required this.firsName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firsName;
  final String lastName;
  final String email;
  final String password;

  factory RequestRegister.fromJson(Map<String,dynamic> json) => RequestRegister(
    firsName: json['firsName'].toString(),
    lastName: json['lastName'].toString(),
    email: json['email'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'firsName': firsName,
    'lastName': lastName,
    'email': email,
    'password': password
  };

  RequestRegister clone() => RequestRegister(
    firsName: firsName,
    lastName: lastName,
    email: email,
    password: password
  );


  RequestRegister copyWith({
    String? firsName,
    String? lastName,
    String? email,
    String? password
  }) => RequestRegister(
    firsName: firsName ?? this.firsName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestRegister && firsName == other.firsName && lastName == other.lastName && email == other.email && password == other.password;

  @override
  int get hashCode => firsName.hashCode ^ lastName.hashCode ^ email.hashCode ^ password.hashCode;
}
