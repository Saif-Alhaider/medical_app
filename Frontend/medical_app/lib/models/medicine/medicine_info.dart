// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Medicines medicinesFromJson(String str) => Medicines.fromJson(json.decode(str));

String medicinesToJson(Medicines data) => json.encode(data.toJson());

class Medicines {
    Medicines({
        required this.numPages,
        required this.medicines,
    });

    final int numPages;
    final List<Medicine> medicines;

    factory Medicines.fromJson(Map<String, dynamic> json) => Medicines(
        numPages: json["num_pages"],
        medicines: List<Medicine>.from(json["medicines"].map((x) => Medicine.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "num_pages": numPages,
        "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
    };
}

class Medicine {
    Medicine({
        required this.id,
        required this.title,
        required this.description,
        required this.medicinetype,
    });

    final int id;
    final String title;
    final String description;
    final String medicinetype;

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
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "medicinetype": medicinetype,
    };
}




/*



 */