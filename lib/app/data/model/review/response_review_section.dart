import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseReviewSection {

  const ResponseReviewSection({
    required this.accuracy,
    required this.communication,
    required this.cleaningness,
    required this.location,
    required this.checkIn,
    required this.value,
  });

  final String accuracy;
  final String communication;
  final String cleaningness;
  final String location;
  final String checkIn;
  final String value;

  factory ResponseReviewSection.fromJson(Map<String,dynamic> json) => ResponseReviewSection(
    accuracy: json['accuracy'].toString(),
    communication: json['communication'].toString(),
    cleaningness: json['cleaningness'].toString(),
    location: json['location'].toString(),
    checkIn: json['check_in'].toString(),
    value: json['value'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'accuracy': accuracy,
    'communication': communication,
    'cleaningness': cleaningness,
    'location': location,
    'check_in': checkIn,
    'value': value
  };

  ResponseReviewSection clone() => ResponseReviewSection(
    accuracy: accuracy,
    communication: communication,
    cleaningness: cleaningness,
    location: location,
    checkIn: checkIn,
    value: value
  );


  ResponseReviewSection copyWith({
    String? accuracy,
    String? communication,
    String? cleaningness,
    String? location,
    String? checkIn,
    String? value
  }) => ResponseReviewSection(
    accuracy: accuracy ?? this.accuracy,
    communication: communication ?? this.communication,
    cleaningness: cleaningness ?? this.cleaningness,
    location: location ?? this.location,
    checkIn: checkIn ?? this.checkIn,
    value: value ?? this.value,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseReviewSection && accuracy == other.accuracy && communication == other.communication && cleaningness == other.cleaningness && location == other.location && checkIn == other.checkIn && value == other.value;

  @override
  int get hashCode => accuracy.hashCode ^ communication.hashCode ^ cleaningness.hashCode ^ location.hashCode ^ checkIn.hashCode ^ value.hashCode;
}
