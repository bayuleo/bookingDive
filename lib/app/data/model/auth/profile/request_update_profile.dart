import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestUpdateProfile {
  const RequestUpdateProfile({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.dateOfBirth,
    this.gender,
    this.countryCode,
    this.phoneNumber,
    this.countryId,
    this.countryName,
    this.address,
    this.yearsOfDiving,
    this.emergencyContact,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String? dateOfBirth;
  final String? gender;
  final String? countryCode;
  final String? phoneNumber;
  final String? countryId;
  final String? countryName;
  final String? address;
  final String? yearsOfDiving;
  final String? emergencyContact;

  factory RequestUpdateProfile.fromJson(Map<String, dynamic> json) =>
      RequestUpdateProfile(
          firstName: json['first_name'].toString(),
          lastName: json['last_name'].toString(),
          email: json['email'].toString(),
          dateOfBirth: json['date_of_birth']?.toString(),
          gender: json['gender']?.toString(),
          countryCode: json['country_code']?.toString(),
          phoneNumber: json['phone_number']?.toString(),
          countryId: json['country_id']?.toString(),
          countryName: json['country_name']?.toString(),
          address: json['address']?.toString(),
          yearsOfDiving: json['years_of_diving']?.toString(),
          emergencyContact: json['emergency_contact']?.toString());

  Map<String, dynamic> toJson() => {
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
        'years_of_diving': yearsOfDiving,
        'emergency_contact': emergencyContact
      };

  RequestUpdateProfile clone() => RequestUpdateProfile(
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
      yearsOfDiving: yearsOfDiving,
      emergencyContact: emergencyContact);

  RequestUpdateProfile copyWith(
          {String? firstName,
          String? lastName,
          String? email,
          Optional<String?>? dateOfBirth,
          Optional<String?>? gender,
          Optional<String?>? countryCode,
          Optional<String?>? phoneNumber,
          Optional<String?>? countryId,
          Optional<String?>? countryName,
          Optional<String?>? address,
          Optional<String?>? yearsOfDiving,
          Optional<String?>? emergencyContact}) =>
      RequestUpdateProfile(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        dateOfBirth: checkOptional(dateOfBirth, () => this.dateOfBirth),
        gender: checkOptional(gender, () => this.gender),
        countryCode: checkOptional(countryCode, () => this.countryCode),
        phoneNumber: checkOptional(phoneNumber, () => this.phoneNumber),
        countryId: checkOptional(countryId, () => this.countryId),
        countryName: checkOptional(countryName, () => this.countryName),
        address: checkOptional(address, () => this.address),
        yearsOfDiving: checkOptional(yearsOfDiving, () => this.yearsOfDiving),
        emergencyContact:
            checkOptional(emergencyContact, () => this.emergencyContact),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RequestUpdateProfile &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          dateOfBirth == other.dateOfBirth &&
          gender == other.gender &&
          countryCode == other.countryCode &&
          phoneNumber == other.phoneNumber &&
          countryId == other.countryId &&
          countryName == other.countryName &&
          address == other.address &&
          yearsOfDiving == other.yearsOfDiving &&
          emergencyContact == other.emergencyContact;

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      dateOfBirth.hashCode ^
      gender.hashCode ^
      countryCode.hashCode ^
      phoneNumber.hashCode ^
      countryId.hashCode ^
      countryName.hashCode ^
      address.hashCode ^
      yearsOfDiving.hashCode ^
      emergencyContact.hashCode;
}
