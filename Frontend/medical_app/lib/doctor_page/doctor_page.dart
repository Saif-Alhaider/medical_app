import 'package:flutter/material.dart';
import '../reuseable_widgets/break_line.dart';
import 'doctor_details.dart';
import 'doctor_location.dart';
import 'doctor_personal_info_main.dart';
import 'doctor_schedual.dart';
import 'doctor_speciality.dart';
import 'package:get/get.dart';

class DoctorPage extends StatelessWidget {
  String img;
  String name;
  String Speciality;
  int rate;

  DoctorPage(
      {required this.img, required this.name, required this.Speciality, required this.rate, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  DoctorPersonalInfoMain(
                    img: img, name: name, rate: rate,
                  ),
                  const SizedBox(height: 35),
                  const DoctorDetails(
                      text:
                          'طبيب اختصاص في علم الامراض بالإضافة الى عدة شهادات دولية في علم النفس (الشفاء الداخلي) '),
                  const SizedBox(height: 20),
                  const DoctorLocation(),
                   DoctorSpeciality(Speciality: Speciality,),
                  const DoctorSchedual(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
