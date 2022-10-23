import 'package:flutter/material.dart';

import '../../main.dart';

abstract class MainLiteColors {
  static const Color bgColor = Color(0xffFDFDFD);
  static const Color primaryFontColor = Colors.black;
  static const Color seconderyFontColor = Colors.white;
  static const Color primaryCardColor = Colors.white;
  static Color seconderyCardColor = const Color(0xffEBB3FF).withOpacity(0.14);
  static const Color masterColor = Color(0xffFDFDFD);
  static const Color backgroundYellow = Color(0xffFFECCD);
  static const Color foreignYellow = Color(0xffFEAE38);
  static const Color backgroundGreen = Color(0xffE8F3DC);
  static const Color foreignGreen = Color(0xffBBDC94);
  static const Color foreignBlue = Colors.blue;
  static const Color backgroundBlue = Color(0xffCDEEFE);
  static const Color foreignRed = Color(0xffF6736A);
  static const Color backgroundRed = Color(0xffFED8D6);
}

abstract class MainDarkColors {
  static const Color bgColor = Color(0xff2F2E2E);
  static const Color primaryFontColor = Color(0xffFDFDFD);
  static const Color seconderyFontColor = Colors.black;
  static const Color primaryCardColor = Colors.black;
  static const Color seconderyCardColor = Color(0xff416A8A);
  static const Color masterColor = Color(0xff121212);
  static const Color backgroundYellow = Color(0xffFFECCD);
  static const Color foreignYellow = Color(0xffFEAE38);
  static const Color backgroundGreen = Color(0xffE8F3DC);
  static const Color foreignGreen = Color(0xffBBDC94);
  static const Color foreignBlue = Colors.blue;
  static const Color backgroundBlue = Color(0xffCDEEFE);
  static const Color foreignRed = Color(0xffF6736A);
  static const Color backgroundRed = Color(0xffFED8D6);
}

abstract class CatogaryColor {
  static Color bgColorBlue = IsDark
      ? const Color(0xff2753F3)
      : const Color(0xff2753F3).withOpacity(0.2);
  static Color bgColorRed =
  IsDark ? Color(0xffFF484C) : Color(0xffFF484C).withOpacity(0.2);
  static Color bgColorGreen =
  IsDark ? Color(0xff0EBE7E) : Color(0xff0EBE7E).withOpacity(0.2);
  static Color bgColorOrange =
  IsDark ? Color(0xffFE7F44) : Color(0xffFE7F44).withOpacity(0.2);

  static Color iconColorBlue =
  IsDark ? const Color(0xffE2E8FF) : const Color(0xff2753F3);
  static Color iconColorRed =
  IsDark ? const Color(0xffFFE5E6) : Color(0xffFF484C);
  static Color iconColorGreen =
  IsDark ? const Color(0xffE1FFF4) : Color(0xff0EBE7E);
  static Color iconColorOrange =
  IsDark ? const Color(0xffFFEAE1) : Color(0xffFE7F44);
}
