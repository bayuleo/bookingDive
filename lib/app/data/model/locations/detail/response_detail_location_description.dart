import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseDetailLocationDescription {

  const ResponseDetailLocationDescription({
    required this.about,
    required this.refund,
    required this.neighborhood,
    required this.interaction,
    required this.other,
  });

  final String about;
  final String refund;
  final String neighborhood;
  final String interaction;
  final String other;

  factory ResponseDetailLocationDescription.fromJson(Map<String,dynamic> json) => ResponseDetailLocationDescription(
    about: json['about'].toString(),
    refund: json['refund'].toString(),
    neighborhood: json['neighborhood'].toString(),
    interaction: json['interaction'].toString(),
    other: json['other'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'about': about,
    'refund': refund,
    'neighborhood': neighborhood,
    'interaction': interaction,
    'other': other
  };

  ResponseDetailLocationDescription clone() => ResponseDetailLocationDescription(
    about: about,
    refund: refund,
    neighborhood: neighborhood,
    interaction: interaction,
    other: other
  );


  ResponseDetailLocationDescription copyWith({
    String? about,
    String? refund,
    String? neighborhood,
    String? interaction,
    String? other
  }) => ResponseDetailLocationDescription(
    about: about ?? this.about,
    refund: refund ?? this.refund,
    neighborhood: neighborhood ?? this.neighborhood,
    interaction: interaction ?? this.interaction,
    other: other ?? this.other,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailLocationDescription && about == other.about && refund == other.refund && neighborhood == other.neighborhood && interaction == other.interaction && other == other.other;

  @override
  int get hashCode => about.hashCode ^ refund.hashCode ^ neighborhood.hashCode ^ interaction.hashCode ^ other.hashCode;
}
