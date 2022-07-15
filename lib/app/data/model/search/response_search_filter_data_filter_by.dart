import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseSearchFilterDataFilterBy {

  const ResponseSearchFilterDataFilterBy({
    required this.key,
    required this.label,
  });

  final String key;
  final String label;

  factory ResponseSearchFilterDataFilterBy.fromJson(Map<String,dynamic> json) => ResponseSearchFilterDataFilterBy(
    key: json['key'].toString(),
    label: json['label'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'key': key,
    'label': label
  };

  ResponseSearchFilterDataFilterBy clone() => ResponseSearchFilterDataFilterBy(
    key: key,
    label: label
  );


  ResponseSearchFilterDataFilterBy copyWith({
    String? key,
    String? label
  }) => ResponseSearchFilterDataFilterBy(
    key: key ?? this.key,
    label: label ?? this.label,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSearchFilterDataFilterBy && key == other.key && label == other.label;

  @override
  int get hashCode => key.hashCode ^ label.hashCode;
}
