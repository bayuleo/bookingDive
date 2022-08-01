import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestPopularLocation {

  const RequestPopularLocation({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;

  factory RequestPopularLocation.fromJson(Map<String,dynamic> json) => RequestPopularLocation(
    page: json['page'] as int,
    limit: json['limit'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit
  };

  RequestPopularLocation clone() => RequestPopularLocation(
    page: page,
    limit: limit
  );


  RequestPopularLocation copyWith({
    int? page,
    int? limit
  }) => RequestPopularLocation(
    page: page ?? this.page,
    limit: limit ?? this.limit,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestPopularLocation && page == other.page && limit == other.limit;

  @override
  int get hashCode => page.hashCode ^ limit.hashCode;
}
