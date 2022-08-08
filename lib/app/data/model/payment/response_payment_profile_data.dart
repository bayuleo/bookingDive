import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponsePaymentProfileData {

  const ResponsePaymentProfileData({
    required this.cardNumber,
  });

  final String cardNumber;

  factory ResponsePaymentProfileData.fromJson(Map<String,dynamic> json) => ResponsePaymentProfileData(
    cardNumber: json['card_number'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'card_number': cardNumber
  };

  ResponsePaymentProfileData clone() => ResponsePaymentProfileData(
    cardNumber: cardNumber
  );


  ResponsePaymentProfileData copyWith({
    String? cardNumber
  }) => ResponsePaymentProfileData(
    cardNumber: cardNumber ?? this.cardNumber,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponsePaymentProfileData && cardNumber == other.cardNumber;

  @override
  int get hashCode => cardNumber.hashCode;
}
