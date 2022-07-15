import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseSearchFilterData {

  const ResponseSearchFilterData({
    required this.group,
    required this.type,
    required this.filterBy,
  });

  final String group;
  final String type;
  final List<ResponseSearchFilterDataFilterBy> filterBy;

  factory ResponseSearchFilterData.fromJson(Map<String,dynamic> json) => ResponseSearchFilterData(
    group: json['group'].toString(),
    type: json['type'].toString(),
    filterBy: (json['filterBy'] as List? ?? []).map((e) => ResponseSearchFilterDataFilterBy.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'group': group,
    'type': type,
    'filterBy': filterBy.map((e) => e.toJson()).toList()
  };

  ResponseSearchFilterData clone() => ResponseSearchFilterData(
    group: group,
    type: type,
    filterBy: filterBy.map((e) => e.clone()).toList()
  );


  ResponseSearchFilterData copyWith({
    String? group,
    String? type,
    List<ResponseSearchFilterDataFilterBy>? filterBy
  }) => ResponseSearchFilterData(
    group: group ?? this.group,
    type: type ?? this.type,
    filterBy: filterBy ?? this.filterBy,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseSearchFilterData && group == other.group && type == other.type && filterBy == other.filterBy;

  @override
  int get hashCode => group.hashCode ^ type.hashCode ^ filterBy.hashCode;
}
