// To parse this JSON data, do
//
//     final Medicine = MedicineFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Medicine> MedicineFromJson(String str) => List<Medicine>.from(json.decode(str).map((x) => Medicine.fromJson(x)));

String MedicineToJson(List<Medicine> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicine {
    Medicine({
        required this.id,
        required this.title,
        required this.description,
        required this.medicinetype,
        required this.pharmacies,
    });

    final int id;
    final String title;
    final String description;
    final String medicinetype;
    final List<Pharmacy> pharmacies;
    
    get medicine_image {
    if (medicinetype == 'Cream') {
      return 'Assets/svg/cream.svg';
    } else if (medicinetype == 'Pills') {
      return 'Assets/svg/pills.svg';
    } else if (medicinetype == 'Syring') {
      return 'Assets/svg/syringe.svg';
    } else if (medicinetype == 'Syrup') {
      return 'Assets/svg/syrup.svg';
    }
  }

    factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        medicinetype: json["medicinetype"],
        pharmacies: List<Pharmacy>.from(json["pharmacies"].map((x) => Pharmacy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "medicinetype": medicinetype,
        "pharmacies": List<dynamic>.from(pharmacies.map((x) => x.toJson())),
    };
}

class Pharmacy {
    Pharmacy({
        required this.name,
        required this.latitude,
        required this.longitude,
    });

    final String name;
    final String latitude;
    final String longitude;

    factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
    };
}
