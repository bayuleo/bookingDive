import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class RequestAddPaymentProfile {

  const RequestAddPaymentProfile({
    required this.cardNumber,
  });

  final String cardNumber;

  factory RequestAddPaymentProfile.fromJson(Map<String,dynamic> json) => RequestAddPaymentProfile(
    cardNumber: json['card_number'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'card_number': cardNumber
  };

  RequestAddPaymentProfile clone() => RequestAddPaymentProfile(
    cardNumber: cardNumber
  );


  RequestAddPaymentProfile copyWith({
    String? cardNumber
  }) => RequestAddPaymentProfile(
    cardNumber: cardNumber ?? this.cardNumber,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestAddPaymentProfile && cardNumber == other.cardNumber;

  @override
  int get hashCode => cardNumber.hashCode;
}
