// To parse this JSON data, do
//
//     final clinics = clinicsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Clinics clinicsFromJson(String str) => Clinics.fromJson(json.decode(str));

String clinicsToJson(Clinics data) => json.encode(data.toJson());

class Clinics {
    Clinics({
        required this.totalCount,
        required this.perPage,
        required this.fromRecord,
        required this.toRecord,
        required this.previousPage,
        required this.currentPage,
        required this.nextPage,
        required this.pageCount,
        required this.data,
    });

    final int totalCount;
    final int perPage;
    final int fromRecord;
    final int toRecord;
    final int previousPage;
    final int currentPage;
    final int nextPage;
    final int pageCount;
    final List<Clinic> data;

    factory Clinics.fromJson(Map<String, dynamic> json) => Clinics(
        totalCount: json["total_count"],
        perPage: json["per_page"],
        fromRecord: json["from_record"],
        toRecord: json["to_record"],
        previousPage: json["previous_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        pageCount: json["page_count"],
        data: List<Clinic>.from(json["data"].map((x) => Clinic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "per_page": perPage,
        "from_record": fromRecord,
        "to_record": toRecord,
        "previous_page": previousPage,
        "current_page": currentPage,
        "next_page": nextPage,
        "page_count": pageCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Clinic {
    Clinic({
        required this.id,
        required this.created,
        required this.updated,
        required this.name,
        required this.address,
        required this.gadress,
        required this.city,
        required this.phone,
        required this.email,
        required this.website,
        required this.logo,
        required this.images,
        required this.about,
    });

    final String id;
    final DateTime created;
    final DateTime updated;
    final String name;
    final String address;
    final String gadress;
    final String city;
    final String phone;
    final String email;
    final String website;
    final String logo;
    final String images;
    final String about;

    factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        name: json["name"],
        address: json["address"] == null ? null : json["address"],
        gadress: json["gadress"] == null ? null : json["gadress"],
        city: json["city"] == null ? null : json["city"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        website: json["website"] == null ? null : json["website"],
        logo: json["logo"],
        images: json["images"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "name": name,
        "address": address == null ? null : address,
        "gadress": gadress == null ? null : gadress,
        "city": city == null ? null : city,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "website": website == null ? null : website,
        "logo": logo,
        "images": images,
        "about": about,
    };
}
