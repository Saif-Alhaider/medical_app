// To parse this JSON data, do
//
//     final Clinics = ClinicsFromJson(jsonString);

import 'dart:convert';

Clinics ClinicsFromJson(String str) => Clinics.fromJson(json.decode(str));

String clinicsToJson(Clinics data) => json.encode(data.toJson());

class Clinics {
    Clinics({
        required this.numPages,
        required this.clinics,
    });

    int numPages;
    List<Clinic> clinics;

    factory Clinics.fromJson(Map<String, dynamic> json) => Clinics(
        numPages: json["num_pages"],
        clinics: List<Clinic>.from(json["clinics"].map((x) => Clinic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "num_pages": numPages,
        "clinics": List<dynamic>.from(clinics.map((x) => x.toJson())),
    };
}

class Clinic {
    Clinic({
        required this.name,
        required this.latitude,
        required this.longitude,
        required this.id,
        required this.image,
    });

    String name;
    String latitude;
    String longitude;
    int id;
    String image;

    factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "id": id,
        "image": image,
    };
}
