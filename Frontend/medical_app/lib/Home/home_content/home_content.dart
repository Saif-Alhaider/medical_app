import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Clinic/clinic_main.dart';
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/Home/home_content/specialities/specialities.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:medical_app/reuseable_widgets/doctors_cards/doctors_cards.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:medical_app/models/doctors_images.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/reuseable_widgets/waiting.dart';

import '../../models/doctor/doctorModel.dart';
import '../../reuseable_widgets/waitingCarousel.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    get_doctors();
    return SingleChildScrollView(
      child: Column(
        children: [
          const Specialities(),
          Column(
            children: [
              ConstantValues.cardsGap,
              ConstantValues.cardsGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  HeadLineText(
                    text: "الاطباء",
                    lineHeight: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: SubText(text: "المزيد"),
                  )
                ],
              ),
              ConstantValues.cardsGap,
              FutureBuilder(
                future: get_doctors(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return WaitingCarousel();
                    case ConnectionState.done:
                    default:
                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            Icon(Icons.error),
                            Text("something went wrong please try again later")
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return DoctorsCards(
                          info: snapshot.data,
                          whereToGo: DoctorPage(
                            name: "احمد",
                            Speciality: "باطنية",
                            rate: 4,
                            img: '',
                          ),
                        );
                      } else {
                        return Text("there is no data");
                      }
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  HeadLineText(
                    text: "العيادات",
                    lineHeight: 1,
                  ),
                  SubText(text: "المزيد")
                ],
              ),
              FutureBuilder(
                future: get_doctors(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return WaitingCarousel();
                    case ConnectionState.done:
                    default:
                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            Icon(Icons.error),
                            Text("something went wrong please try again later")
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return DoctorsCards(
                          info: snapshot.data,
                          whereToGo: ClinicMain(),
                        );
                      } else {
                        return Text("there is no data");
                      }
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<List<Doctor>> get_doctors() async {
  const String url = 'http://10.0.2.2:8000/api/doctor/doctors';
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
  });
  final body = jsonDecode(response.body) as List;

  // ignore: unnecessary_cast
  print(body[0]);
  var recievedDoctors = body
      .map(
        (e) => Doctor(
            full_name: e['full name'],
            speciality: e['speciality'],
            image: "http://10.0.2.2:8000/${e['image']}"),
      )
      .toList() as List<Doctor>;
  return recievedDoctors;
}
