import 'package:meta/meta.dart';
import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.dateJoined,
    required this.accountType,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final dynamic phoneNumber;
  final dynamic address;
  final DateTime dateJoined;
  final String accountType;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        dateJoined: DateTime.parse(json["date_joined"]),
        accountType: json["account_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "address": address,
        "date_joined": dateJoined.toIso8601String(),
        "account_type": accountType,
      };
}
