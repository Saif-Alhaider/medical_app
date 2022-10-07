import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medical_app/reuseable_widgets/waiting.dart';
import '../main.dart';
import '../main_colors.dart';
import '../models/doctor/doctor.dart';
import '../reuseable_widgets/break_line.dart';
import 'doctor_details.dart';
import 'doctor_location.dart';
import 'doctor_personal_info_main.dart';
import 'doctor_schedual.dart';
import 'doctor_speciality.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DoctorPage extends StatelessWidget {
  final String? doctor_id;

  DoctorPage({required this.doctor_id, super.key});

  @override
  Widget build(BuildContext context) {
    getDoctorInfo(doctor_id: doctor_id!);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            IsDark ? MainDarkColors.bgColor : MainLiteColors.bgColor,
        body: FutureBuilder(
          future: getDoctorInfo(doctor_id: doctor_id!),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Waiting();
              case ConnectionState.done:
              default:
                if (snapshot.hasError) {
                  return Text("something went wrong");
                } else if (snapshot.hasData) {
                  print("data ${snapshot.data}");
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                            ),
                            DoctorPersonalInfoMain(
                              img: "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg",
                              name: snapshot.data!.fullName,
                              doctor_number: snapshot.data!.phone,
                            ),
                            const SizedBox(height: 35),
                            DoctorDetails(text: ""),//snapshot.data.description
                            const SizedBox(height: 20),
                            DoctorLocation(location: snapshot.data!.city),
                            DoctorSpeciality(
                              Speciality: snapshot.data?.specialty?.title??"",
                            ),
                            DoctorSchedual(
                                active_dates: snapshot.data!.active_dates,
                                doctor_id: doctor_id),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Text("there is no data");
                }
            }
          },
        ),
      ),
    );
  }
}

Future<Doctor> getDoctorInfo({required String doctor_id}) async {
  final String url = "http://10.0.2.2:8000/api/doctor/doctor/$doctor_id";
  var response = await http.get(Uri.parse(url));
  Doctor result = doctorFromJson(response.body);
  // print(result.images);
  // result = Doctor(
  //     full_name: result['fullName'],
  //     speciality: result['speciality'],
  //     image: result['image'],
  //     description: result['description'],
  //     email: result['email'],
  //     country: result['country'],
  //     active_dates: result['active_dates'],
  //     phone_number: result['phone_number']);
  return result;
}
