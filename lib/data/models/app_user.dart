// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppUser {
  String id;
  String email;
  String password;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicUrl;
  String about;
  List<String> bookedAppointmentsIDs;
  AppUser({
    required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicUrl,
    required this.about,
    required this.bookedAppointmentsIDs,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profilePicUrl,
    String? about,
    List<String>? bookedAppointmentsIDs,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      about: about ?? this.about,
      bookedAppointmentsIDs:
          bookedAppointmentsIDs ?? this.bookedAppointmentsIDs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'profilePicUrl': profilePicUrl,
      'about': about,
      'bookedAppointmentsIDs': bookedAppointmentsIDs,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profilePicUrl: map['profilePicUrl'] as String,
      about: map['about'] as String,
      bookedAppointmentsIDs:
          List<String>.from((map['bookedAppointmentsIDs'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, password: $password, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, profilePicUrl: $profilePicUrl, about: $about, bookedAppointmentsIDs: $bookedAppointmentsIDs)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.profilePicUrl == profilePicUrl &&
        other.about == about &&
        listEquals(other.bookedAppointmentsIDs, bookedAppointmentsIDs);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        profilePicUrl.hashCode ^
        about.hashCode ^
        bookedAppointmentsIDs.hashCode;
  }
}
