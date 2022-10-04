// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome doctorsFromJson(String str) => Welcome.fromJson(json.decode(str));

String doctorsToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.totalCount,
        required this.perPage,
        required this.fromRecord,
        required this.toRecord,
        required this.previousPage,
        required this.nextPage,
        required this.currentPage,
        required this.pageCount,
        required this.data,
    });

    final int totalCount;
    final int perPage;
    final int fromRecord;
    final int toRecord;
    final int previousPage;
    final int nextPage;
    final int currentPage;
    final int pageCount;
    final List<Doctor> data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        totalCount: json["total_count"],
        perPage: json["per_page"],
        fromRecord: json["from_record"],
        toRecord: json["to_record"],
        previousPage: json["previous_page"],
        nextPage: json["next_page"],
        currentPage: json["current_page"],
        pageCount: json["page_count"],
        data: List<Doctor>.from(json["data"].map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "per_page": perPage,
        "from_record": fromRecord,
        "to_record": toRecord,
        "previous_page": previousPage,
        "next_page": nextPage,
        "current_page": currentPage,
        "page_count": pageCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Doctor {
    Doctor({
        required this.id,
        required this.fullName,
        required this.address,
        required this.gadress,
        required this.city,
        required this.phone,
         this.specialty,
        required this.email,
        required this.images,
        required this.isActive,
        required this.isFeatured,
    });

    final String id;
    final String fullName;
    final String address;
    final String gadress;
    final String city;
    final String phone;
    final Specialty? specialty;
    final String email;
    final dynamic images;
    final bool isActive;
    final bool isFeatured;

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullName: json["full_name"],
        address: json["address"],
        gadress: json["gadress"] == null ? null : json["gadress"],
        city: json["city"],
        phone: json["phone"] == null ? null : json["phone"],
        specialty: json["specialty"] == null ? null : Specialty.fromJson(json["specialty"]),
        email: json["email"] == null ? null : json["email"],
        images: json["images"],
        isActive: json["is_active"],
        isFeatured: json["is_featured"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "address": address,
        "gadress": gadress == null ? null : gadress,
        "city": city,
        "phone": phone == null ? null : phone,
        "specialty": specialty == null ? null : specialty?.toJson(),
        "email": email == null ? null : email,
        "images": images,
        "is_active": isActive,
        "is_featured": isFeatured,
    };
}

class Specialty {
    Specialty({
        required this.id,
        required this.title,
    });

    final String id;
    final String title;

    factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}
