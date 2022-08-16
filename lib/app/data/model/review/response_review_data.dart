import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ResponseReviewData {

  const ResponseReviewData({
    required this.profileId,
    required this.avatar,
    required this.name,
    required this.star,
    required this.review,
    required this.images,
    required this.reviewSection,
    required this.package,
    required this.posted,
  });

  final String profileId;
  final String avatar;
  final String name;
  final String star;
  final String review;
  final List<String> images;
  final ResponseReviewSection reviewSection;
  final String package;
  final String posted;

  factory ResponseReviewData.fromJson(Map<String,dynamic> json) => ResponseReviewData(
    profileId: json['profile:id'].toString(),
    avatar: json['avatar'].toString(),
    name: json['name'].toString(),
    star: json['star'].toString(),
    review: json['review'].toString(),
    images: (json['images'] as List? ?? []).map((e) => e as String).toList(),
    reviewSection: ResponseReviewSection.fromJson(json['review_section'] as Map<String, dynamic>),
    package: json['package'].toString(),
    posted: json['posted'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'profile:id': profileId,
    'avatar': avatar,
    'name': name,
    'star': star,
    'review': review,
    'images': images.map((e) => e.toString()).toList(),
    'review_section': reviewSection.toJson(),
    'package': package,
    'posted': posted
  };

  ResponseReviewData clone() => ResponseReviewData(
    profileId: profileId,
    avatar: avatar,
    name: name,
    star: star,
    review: review,
    images: images.toList(),
    reviewSection: reviewSection.clone(),
    package: package,
    posted: posted
  );


  ResponseReviewData copyWith({
    String? profileId,
    String? avatar,
    String? name,
    String? star,
    String? review,
    List<String>? images,
    ResponseReviewSection? reviewSection,
    String? package,
    String? posted
  }) => ResponseReviewData(
    profileId: profileId ?? this.profileId,
    avatar: avatar ?? this.avatar,
    name: name ?? this.name,
    star: star ?? this.star,
    review: review ?? this.review,
    images: images ?? this.images,
    reviewSection: reviewSection ?? this.reviewSection,
    package: package ?? this.package,
    posted: posted ?? this.posted,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseReviewData && profileId == other.profileId && avatar == other.avatar && name == other.name && star == other.star && review == other.review && images == other.images && reviewSection == other.reviewSection && package == other.package && posted == other.posted;

  @override
  int get hashCode => profileId.hashCode ^ avatar.hashCode ^ name.hashCode ^ star.hashCode ^ review.hashCode ^ images.hashCode ^ reviewSection.hashCode ^ package.hashCode ^ posted.hashCode;
}
