import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestDetailLocation {

  const RequestDetailLocation({
    required this.date,
    required this.diver,
  });

  final String date;
  final String diver;

  factory RequestDetailLocation.fromJson(Map<String,dynamic> json) => RequestDetailLocation(
    date: json['date'].toString(),
    diver: json['diver'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'date': date,
    'diver': diver
  };

  RequestDetailLocation clone() => RequestDetailLocation(
    date: date,
    diver: diver
  );


  RequestDetailLocation copyWith({
    String? date,
    String? diver
  }) => RequestDetailLocation(
    date: date ?? this.date,
    diver: diver ?? this.diver,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestDetailLocation && date == other.date && diver == other.diver;

  @override
  int get hashCode => date.hashCode ^ diver.hashCode;
}
