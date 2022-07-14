import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../../index.dart';



@immutable
class ResponseProfileData {

  const ResponseProfileData({
    required this.idProfile,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.gender,
    this.countryCode,
    this.phoneNumber,
    required this.countryId,
    required this.countryName,
    required this.address,
    required this.yearDiving,
    required this.emergencyContact,
    required this.avatar,
  });

  final int idProfile;
  final String firstName;
  final String lastName;
  final String email;
  final String dateOfBirth;
  final String gender;
  final String? countryCode;
  final String? phoneNumber;
  final String countryId;
  final String countryName;
  final String address;
  final int yearDiving;
  final String emergencyContact;
  final String avatar;

  factory ResponseProfileData.fromJson(Map<String,dynamic> json) => ResponseProfileData(
    idProfile: json['id_profile'] as int,
    firstName: json['first_name'].toString(),
    lastName: json['last_name'].toString(),
    email: json['email'].toString(),
    dateOfBirth: json['date_of_birth'].toString(),
    gender: json['gender'].toString(),
    countryCode: json['country_code']?.toString(),
    phoneNumber: json['phone_number']?.toString(),
    countryId: json['country_id'].toString(),
    countryName: json['country_name'].toString(),
    address: json['address'].toString(),
    yearDiving: json['year_diving'] as int,
    emergencyContact: json['emergency_contact'].toString(),
    avatar: json['avatar'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id_profile': idProfile,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'date_of_birth': dateOfBirth,
    'gender': gender,
    'country_code': countryCode,
    'phone_number': phoneNumber,
    'country_id': countryId,
    'country_name': countryName,
    'address': address,
    'year_diving': yearDiving,
    'emergency_contact': emergencyContact,
    'avatar': avatar
  };

  ResponseProfileData clone() => ResponseProfileData(
    idProfile: idProfile,
    firstName: firstName,
    lastName: lastName,
    email: email,
    dateOfBirth: dateOfBirth,
    gender: gender,
    countryCode: countryCode,
    phoneNumber: phoneNumber,
    countryId: countryId,
    countryName: countryName,
    address: address,
    yearDiving: yearDiving,
    emergencyContact: emergencyContact,
    avatar: avatar
  );


  ResponseProfileData copyWith({
    int? idProfile,
    String? firstName,
    String? lastName,
    String? email,
    String? dateOfBirth,
    String? gender,
    Optional<String?>? countryCode,
    Optional<String?>? phoneNumber,
    String? countryId,
    String? countryName,
    String? address,
    int? yearDiving,
    String? emergencyContact,
    String? avatar
  }) => ResponseProfileData(
    idProfile: idProfile ?? this.idProfile,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    gender: gender ?? this.gender,
    countryCode: checkOptional(countryCode, () => this.countryCode),
    phoneNumber: checkOptional(phoneNumber, () => this.phoneNumber),
    countryId: countryId ?? this.countryId,
    countryName: countryName ?? this.countryName,
    address: address ?? this.address,
    yearDiving: yearDiving ?? this.yearDiving,
    emergencyContact: emergencyContact ?? this.emergencyContact,
    avatar: avatar ?? this.avatar,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseProfileData && idProfile == other.idProfile && firstName == other.firstName && lastName == other.lastName && email == other.email && dateOfBirth == other.dateOfBirth && gender == other.gender && countryCode == other.countryCode && phoneNumber == other.phoneNumber && countryId == other.countryId && countryName == other.countryName && address == other.address && yearDiving == other.yearDiving && emergencyContact == other.emergencyContact && avatar == other.avatar;

  @override
  int get hashCode => idProfile.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ dateOfBirth.hashCode ^ gender.hashCode ^ countryCode.hashCode ^ phoneNumber.hashCode ^ countryId.hashCode ^ countryName.hashCode ^ address.hashCode ^ yearDiving.hashCode ^ emergencyContact.hashCode ^ avatar.hashCode;
}
