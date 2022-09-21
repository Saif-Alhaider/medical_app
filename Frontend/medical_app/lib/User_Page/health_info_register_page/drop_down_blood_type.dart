// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DropDownBloodType extends StatelessWidget {
//   final Rx<String> bloodType;
//   const DropDownBloodType({
//     Key? key,
//     required this.bloodType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                             dropdownColor: Colors.white,
//                             hint: Obx(() => Text(bloodType.value.isEmpty
//                                 ? "فصيلة الدم"
//                                 : bloodType.value)),
//                             items: const [
//                               DropdownMenuItem(
//                                 value: "A+",
//                                 child: Text("A+"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "A-",
//                                 child: Text("A-"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "B+",
//                                 child: Text("B+"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "B-",
//                                 child: Text("B-"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "AB+",
//                                 child: Text("AB+"),
//                               ),
//                               DropdownMenuItem(
//                                 value: "AB-",
//                                 child: Text("AB-"),
//                               ),
//                             ],
//                             onChanged: (type) {
//                               bloodType.value = type!;
//                               print("${bloodType.value} type=>${type}");
//                             }),
//                       );
//   }
// }
