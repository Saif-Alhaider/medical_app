import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));



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
    required this.active_dates,
  });

  final String id;
  final String fullName;
  final String address;
  final String gadress;
  final String city;
  final String phone;
  final Specialty? specialty;
  final String email;
  final String? images;
  final bool isActive;
  final bool isFeatured;
  final List active_dates;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullName: json["full_name"],
        address: json["address"],
        gadress: json["gadress"] == null ? null : json["gadress"],
        city: json["city"],
        phone: json["phone"] == null ? null : json["phone"],
        specialty: json["specialty"] == null
            ? null
            : Specialty.fromJson(json["specialty"]),
        email: json["email"] == null ? null : json["email"],
        images: json["images"] == null ? null :json["images"],
        isActive: json["is_active"],
        isFeatured: json["is_featured"],
        active_dates: json["active_dates"],
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
        "active_dates": active_dates == null ? null : active_dates,
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
