import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class Error {

  const Error({
    this.message,
  });

  final String? message;

  factory Error.fromJson(Map<String,dynamic> json) => Error(
    message: json['message']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'message': message
  };

  Error clone() => Error(
    message: message
  );


  Error copyWith({
    Optional<String?>? message
  }) => Error(
    message: checkOptional(message, () => this.message),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Error && message == other.message;

  @override
  int get hashCode => message.hashCode;
}
