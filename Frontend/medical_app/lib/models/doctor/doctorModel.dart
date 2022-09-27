class Doctor {
  final String full_name;
  final String speciality;
  final String image;
  final String? email;
  final String? description;
  final String? country;
  final List? active_dates;
  Doctor({
    required this.full_name,
    required this.speciality,
    required this.image,
    this.email,
    this.description,
    this.country,
    this.active_dates,
  });
}

