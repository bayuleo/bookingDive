import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class RequestPopularDiving {

  const RequestPopularDiving({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;

  factory RequestPopularDiving.fromJson(Map<String,dynamic> json) => RequestPopularDiving(
    page: json['page'] as int,
    limit: json['limit'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit
  };

  RequestPopularDiving clone() => RequestPopularDiving(
    page: page,
    limit: limit
  );


  RequestPopularDiving copyWith({
    int? page,
    int? limit
  }) => RequestPopularDiving(
    page: page ?? this.page,
    limit: limit ?? this.limit,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestPopularDiving && page == other.page && limit == other.limit;

  @override
  int get hashCode => page.hashCode ^ limit.hashCode;
}
