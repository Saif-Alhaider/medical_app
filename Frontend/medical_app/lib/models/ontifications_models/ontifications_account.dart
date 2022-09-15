import 'package:flutter/material.dart';

class DataNot_1 {
  IconData icon;
  String text;
  final now = DateTime.now();
  DataNot_1({
    required this.icon,
    required this.text,
  });
  static List<DataNot_1> datas = [
    DataNot_1(
        icon: Icons.email, text: ' ارسل اليك الدكتور محمد علي موسى راجيته  ')
  ];
}

// ignore: camel_case_types
class DataNot_2 {
  IconData icon;
  String text;
  final now = DateTime.now();
  DataNot_2({
    required this.icon,
    required this.text,
  });
  static List<DataNot_2> datas = [
    DataNot_2(
        icon: Icons.email, text: 'لقد وافق الدكتور محمد علي موسى على الحجز')
  ];
}
