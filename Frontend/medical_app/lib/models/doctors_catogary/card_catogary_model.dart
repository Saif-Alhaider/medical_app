import 'dart:ui';

import '../../main_colors.dart';

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
      Bgcolor: CatogaryColor.bgColorBlue,
      IconsColor: CatogaryColor.iconColorBlue,
      IconSize: 32,
      icon: "Assets/icons/dentist_icon.svg",
      text: "اسنان"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorRed,
      IconsColor: CatogaryColor.iconColorRed,
      IconSize: 32,
      icon: "Assets/icons/Nutritionist_icon.svg",
      text: "تغذية"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorGreen,
      IconsColor: CatogaryColor.iconColorGreen,
      IconSize: 24,
      icon: "Assets/icons/eys_icon.svg",
      text: "عيون"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorOrange,
      IconsColor: CatogaryColor.iconColorOrange,
      IconSize: 36,
      icon: "Assets/icons/heart-beating-svgrepo-com.svg",
      text: "قلب"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorBlue,
      IconsColor: CatogaryColor.iconColorBlue,
      IconSize: 32,
      icon: "Assets/icons/ball-of-the-knee-svgrepo-com.svg",
      text: "عظام"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorRed,
      IconsColor: CatogaryColor.iconColorRed,
      IconSize: 32,
      icon: "Assets/icons/kidney-svgrepo-com.svg",
      text: "مجاري بولية"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorGreen,
      IconsColor: CatogaryColor.iconColorGreen,
      IconSize: 32,
      icon: "Assets/icons/blood-drop-svgrepo-com.svg",
      text: "امراض الدم"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorOrange,
      IconsColor: CatogaryColor.iconColorOrange,
      IconSize: 32,
      icon: "Assets/icons/nurse-svgrepo-com.svg",
      text: "اطفال"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorBlue,
      IconsColor: CatogaryColor.iconColorBlue,
      IconSize: 32,
      icon: "Assets/icons/digestive.svg",
      text: "جهاز الهضمي"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorRed,
      IconsColor: CatogaryColor.iconColorRed,
      IconSize: 32,
      icon: "Assets/icons/neuron-svgrepo-com.svg",
      text: "اعصاب"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorBlue,
      IconsColor: CatogaryColor.iconColorBlue,
      IconSize: 32,
      icon: "Assets/icons/lungs-svgrepo-com (1).svg",
      text: "جهاز التنفسي"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorOrange,
      IconsColor: CatogaryColor.iconColorOrange,
      IconSize: 32,
      icon: "Assets/icons/virus-svgrepo-com.svg",
      text: "امراض معدية"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorBlue,
      IconsColor: CatogaryColor.iconColorBlue,
      IconSize: 32,
      icon: "Assets/icons/human-muscle-svgrepo-com.svg",
      text: "اورام"),
  Catogary(
      Bgcolor: CatogaryColor.bgColorGreen,
      IconsColor: CatogaryColor.iconColorGreen,
      IconSize: 32,
      icon: "Assets/icons/thyroid-svgrepo-com.svg",
      text: "اذن وانف وحنجرة"),
];
