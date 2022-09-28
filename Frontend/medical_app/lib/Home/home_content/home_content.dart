import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Clinic/clinic_main.dart';
import 'package:medical_app/Home/constants.dart';

import 'package:medical_app/Home/home_content/specialities/specialities.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:medical_app/models/clinic/clinic_model.dart';
import 'package:medical_app/more_screen/more_screen.dart';
import 'package:medical_app/reuseable_widgets/home_card.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:medical_app/models/doctors_images.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/reuseable_widgets/waiting.dart';

import '../../models/doctor/doctorModel.dart';
import '../../models/home_card_info.dart';
import '../../reuseable_widgets/waitingCarousel.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    get_clinics();
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
                children: [
                  const HeadLineText(
                    text: "الاطباء",
                    lineHeight: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreScreen(),
                              ));
                        },
                        child: SubText(text: "المزيد")),
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
                          children: const [
                            Icon(Icons.error),
                            Text("something went wrong please try again later")
                          ],
                        );
                      } else if (snapshot.hasData) {
                        return HomeCard(
                          info: snapshot.data,
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
                        return HomeCard(
                          info: snapshot.data,
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

Future<List<HomeCardInfo>> get_doctors() async {
  const String url = 'http://10.0.2.2:8000/api/doctor/doctors?page_num=1';
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
  });
  final body = jsonDecode(response.body);

  // ignore: unnecessary_cast
  var recievedDoctors = body['doctors']
      .map(
        (e) => HomeCardInfo(
            title: e['full_name'],
            subTitle: e['speciality'],
            image: "http://10.0.2.2:8000/${e['image']}",
            id: e['id']),
      )
      .toList();
  return recievedDoctors;
}

Future<List> get_clinics() async {
  const String url = 'http://10.0.2.2:8000/api/clinics/?page_num=1';

  var response = await http.get(Uri.parse(url));

  final Clinics result = ClinicsFromJson(response.body);
  print(result.clinics);

  return [];
}
