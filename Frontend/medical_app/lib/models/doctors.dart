// To parse this JSON data, do
//
//     final welcome = DoctorsFromJson(jsonString);

import 'dart:convert';

Doctors DoctorsFromJson(String str) => Doctors.fromJson(json.decode(str));

String doctorsToJson(Doctors data) => json.encode(data.toJson());

class Doctors {

    Doctors({
        required this.numPages,
        required this.doctors,
    });

    int numPages;
    List<OneDoctor> doctors;

    factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
        numPages: json["num_pages"],
        doctors: List<OneDoctor>.from(json["doctors"].map((x) => OneDoctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "num_pages": numPages,
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
    };
}

class OneDoctor {
    OneDoctor({
        required this.fullName,
        required this.speciality,
        required this.image,
        required this.id,
    });

    String fullName;
    String speciality;
    String image;
    int id;

    factory OneDoctor.fromJson(Map<String, dynamic> json) => OneDoctor(
        fullName: json["full_name"],
        speciality: json["speciality"],
        image: json["image"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "speciality": speciality,
        "image": image,
        "id": id,
    };
}
