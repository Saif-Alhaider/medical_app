class DoctorCardMol {
  String img;
  String name;
  String specialty;
  int rate;

  DoctorCardMol(
      {required this.img,
      required this.name,
      required this.specialty,
      required this.rate});
}

List<DoctorCardMol> DoctorsList = [
  DoctorCardMol(
      img: 'Assets/images/doctors/doctor1.png',
      name: 'د.محمد الاراكي',
      specialty: ' قلب',
      rate: 4),
  DoctorCardMol(
      img: 'Assets/images/doctors/doctor2.png',
      name: 'د.نور البياتي',
      specialty: 'تجميل',
      rate: 3),
      
  DoctorCardMol(
      img: 'Assets/images/doctors/doctor3.png',
      name: 'د.زينب الموسوي',
      specialty: 'باطنية',
      rate: 3),

];
