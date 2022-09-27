// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:medical_app/reuseable_widgets/star_rate.dart';
// import '../../doctor_page/doctor_page.dart';
// import '../../models/doctor_appointments/card_doctor_model.dart';


// class CardOfDoctor extends StatelessWidget {
//    CardOfDoctor({
//     Key? key,
//     required this.doctor

//   }) : super(key: key);
//   final Color primaryTextColor = Colors.black;
//   final Color seconderyTextColor = Colors.grey;
//   DoctorCardMol doctor;


//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         Get.to(DoctorPage(img: doctor.img, name: doctor.name, Speciality: doctor.specialty, rate: doctor.rate,));
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 8),
//         padding: EdgeInsets.only(bottom: 8),
//         width: Get.width * 0.4,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16), color: Colors.white),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(doctor.img),
//             Text(
//               doctor.name,
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 color: primaryTextColor,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//              doctor.specialty,
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                 color: seconderyTextColor,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//              StartRate(
//               rate:doctor.rate, size: 14 ,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }