import 'dart:ui';

class  Catogary{
  String icon;
  String text;
  Color color;
  Catogary({required this.color,required this.icon, required this.text});
}


List<Catogary> listCatogary=[
  Catogary(color: Color(0xff2753F3).withOpacity(0.2), icon: "Assets/icons/dentist_icon.svg", text: "اسنان"),
  Catogary(color: Color(0xff0EBE7E).withOpacity(0.2), icon: "Assets/icons/eys_icon.svg", text: "عيون"),
  Catogary(color: Color(0xffFE7F44).withOpacity(0.2), icon: "Assets/icons/hart_icon.svg", text: "قلب"),
  Catogary(color: Color(0xffFF484C).withOpacity(0.2), icon: "Assets/icons/Nutritionist_icon.svg", text: "تغذية"),
];