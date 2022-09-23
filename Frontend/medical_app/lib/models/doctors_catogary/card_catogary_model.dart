import 'dart:ui';

class Catogary {
  String icon;
  String text;
  Color Bgcolor;
  Color IconsColor;
  double IconSize;
  Catogary(
      {required this.Bgcolor,
      required this.IconsColor,
      required this.icon,
      required this.text,
      required this.IconSize});
}

List<Catogary> listCatogary = [
  Catogary(
      Bgcolor: Color(0xff2753F3).withOpacity(0.2),
      IconsColor: Color(0xff2753F3),
      IconSize: 24,
      icon: "Assets/icons/dentist_icon.svg",
      text: "اسنان"),
  Catogary(
      Bgcolor: Color(0xffFF484C).withOpacity(0.2),
      IconsColor: Color(0xffFF484C),
      IconSize: 24,
      icon: "Assets/icons/Nutritionist_icon.svg",
      text: "تغذية"),
  Catogary(
      Bgcolor: Color(0xff0EBE7E).withOpacity(0.2),
      IconsColor: Color(0xff0EBE7E),
      IconSize: 16,
      icon: "Assets/icons/eys_icon.svg",
      text: "عيون"),
  Catogary(
      Bgcolor: Color(0xffFE7F44).withOpacity(0.2),
      IconsColor: Color(0xffFE7F44),
      IconSize: 24,
      icon: "Assets/icons/heart-beating-svgrepo-com.svg",
      text: "قلب"),
  Catogary(
      Bgcolor: Color(0xff2753F3).withOpacity(0.2),
      IconsColor: Color(0xff2753F3),
      IconSize: 24,
      icon: "Assets/icons/ball-of-the-knee-svgrepo-com.svg",
      text: "عظام"),
  Catogary(
      Bgcolor: Color(0xffFF484C).withOpacity(0.2),
      IconsColor: Color(0xffFF484C),
      IconSize: 24,
      icon: "Assets/icons/kidney-svgrepo-com.svg",
      text: "مجاري بولية"),
  Catogary(
      Bgcolor: Color(0xff0EBE7E).withOpacity(0.2),
      IconsColor: Color(0xff0EBE7E),
      IconSize: 24,
      icon: "Assets/icons/blood-drop-svgrepo-com.svg",
      text: "امراض الدم"),
  Catogary(
      Bgcolor: Color(0xffFE7F44).withOpacity(0.2),
      IconsColor: Color(0xffFE7F44),
      IconSize: 24,
      icon: "Assets/icons/nurse-svgrepo-com.svg",
      text: "اطفال"),
  Catogary(
      Bgcolor: Color(0xff2753F3).withOpacity(0.2),
      IconsColor: Color(0xff2753F3),
      IconSize: 24,
      icon: "Assets/icons/digestive.svg",
      text: "جهاز الهضمي"),
  Catogary(
      Bgcolor: Color(0xffFF484C).withOpacity(0.2),
      IconsColor: Color(0xffFF484C),
      IconSize: 24,
      icon: "Assets/icons/neuron-svgrepo-com.svg",
      text: "اعصاب"),
  Catogary(
      Bgcolor: Color(0xff2753F3).withOpacity(0.2),
      IconsColor: Color(0xff2753F3),
      IconSize: 24,
      icon: "Assets/icons/lungs-svgrepo-com (1).svg",
      text: "جهاز التنفسي"),
  Catogary(
      Bgcolor: Color(0xffFE7F44).withOpacity(0.2),
      IconsColor: Color(0xffFE7F44),
      IconSize: 24,
      icon: "Assets/icons/virus-svgrepo-com.svg",
      text: "امراض معدية"),
  Catogary(
      Bgcolor: Color(0xff2753F3).withOpacity(0.2),
      IconsColor: Color(0xff2753F3),
      IconSize: 24,
      icon: "Assets/icons/human-muscle-svgrepo-com.svg",
      text: "اورام"),
  Catogary(
      Bgcolor: Color(0xff0EBE7E).withOpacity(0.2),
      IconsColor: Color(0xff0EBE7E),
      IconSize: 24,
      icon: "Assets/icons/thyroid-svgrepo-com.svg",
      text: "اذن وانف وحنجرة"),
];
