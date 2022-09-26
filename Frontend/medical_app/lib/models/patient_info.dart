class UserPersonalInfo {
  final String fullName;
  final String email;
  final UserHealthInfo userHealthInfo;
  UserPersonalInfo({
    required this.fullName,
    required this.email,
    required this.userHealthInfo,
  });
}


class UserHealthInfo {
  final String gender;
  final int height;
  final int weight;
  final int age;
  final String blood_type;
  final String description;
  UserHealthInfo({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.blood_type,
    required this.description,
  });

  
  

}
