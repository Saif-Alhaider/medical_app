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
      img: 'Assets/clinic/Ellipse6.png',
      name: 'د.محمد الاراكي',
      specialty: 'اخصائي جراحة قلب',
      rate: 4),
  DoctorCardMol(
      img: 'Assets/clinic/Ellipse141.png',
      name: 'د.نور البياتي',
      specialty: 'اخصائية تجميل',
      rate: 3),
      
  DoctorCardMol(
      img: 'Assets/clinic/image.png',
      name: 'د.زينب الموسوي',
      specialty: 'اخصائيةباطنية',
      rate: 3),
      DoctorCardMol(
      img: 'Assets/clinic/Ellipse6.png',
      name: 'د.زينب الموسوي',
      specialty: 'اخصائيةباطنية',
      rate: 3),
];
