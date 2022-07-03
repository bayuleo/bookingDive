import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class Message {

  const Message({
    required this.isSuccess,
    required this.transactionId,
    required this.timestamp,
    this.detail,
    this.description,
  });

  final bool isSuccess;
  final String transactionId;
  final int timestamp;
  final String? detail;
  final String? description;

  factory Message.fromJson(Map<String,dynamic> json) => Message(
    isSuccess: json['isSuccess'] as bool,
    transactionId: json['transactionId'].toString(),
    timestamp: json['timestamp'] as int,
    detail: json['detail']?.toString(),
    description: json['description']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'isSuccess': isSuccess,
    'transactionId': transactionId,
    'timestamp': timestamp,
    'detail': detail,
    'description': description
  };

  Message clone() => Message(
    isSuccess: isSuccess,
    transactionId: transactionId,
    timestamp: timestamp,
    detail: detail,
    description: description
  );


  Message copyWith({
    bool? isSuccess,
    String? transactionId,
    int? timestamp,
    Optional<String?>? detail,
    Optional<String?>? description
  }) => Message(
    isSuccess: isSuccess ?? this.isSuccess,
    transactionId: transactionId ?? this.transactionId,
    timestamp: timestamp ?? this.timestamp,
    detail: checkOptional(detail, () => this.detail),
    description: checkOptional(description, () => this.description),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Message && isSuccess == other.isSuccess && transactionId == other.transactionId && timestamp == other.timestamp && detail == other.detail && description == other.description;

  @override
  int get hashCode => isSuccess.hashCode ^ transactionId.hashCode ^ timestamp.hashCode ^ detail.hashCode ^ description.hashCode;
}
