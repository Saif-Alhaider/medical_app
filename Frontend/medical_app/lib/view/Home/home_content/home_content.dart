import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/view/Clinic/clinic_main.dart';
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/view/Home/doctors_cards.dart';

import 'package:medical_app/view/Home/home_content/specialities/specialities.dart';
import 'package:medical_app/view/doctor_page/doctor_page.dart';
import 'package:medical_app/models/clinic/clinic_model.dart';
import 'package:medical_app/models/doctor/doctors.dart';
import 'package:medical_app/view/more_screen/more_doctors_screen.dart';
import 'package:medical_app/view/reuseable_widgets/connection%20widgets/something_went_wrong.dart';
import 'package:medical_app/view/reuseable_widgets/home_card.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';
import 'package:medical_app/models/doctors_images.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/view/reuseable_widgets/waiting.dart';

import '../../../main.dart';
import '../../theme/main_colors.dart';
import '../../../models/home_card_info.dart';
import '../../more_screen/more_clinics_screen.dart';
import '../../reuseable_widgets/connection widgets/waitingCarousel.dart';
import 'package:get/get.dart';

class HomeContent extends StatefulWidget {
  HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late Future doctorsData;

  @override
  void initState() {
    super.initState();
    doctorsData = get_doctors();
  }

  @override
  Widget build(BuildContext context) {
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
                  HeadLineText(
                    text: "الاطباء",
                    lineHeight: 1,
                    color: IsDark
                        ? MainDarkColors.primaryFontColor
                        : MainLiteColors.primaryFontColor,
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
                          Get.to(MoreDoctorsScreen(
                            more_url:
                                "http://10.0.2.2:8000/api/doctor/doctors/isfeatured?per_page=12&page=",
                          ));
                        },
                        child: SubText(text: "المزيد")),
                  )
                ],
              ),
              ConstantValues.cardsGap,
              FutureBuilder(
                future: doctorsData,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return WaitingCarousel();

                    case ConnectionState.done:
                    default:
                      if (snapshot.hasError) {
                        return SomethingWentWrong();
                      } else if (snapshot.hasData) {
                        return DoctorsCards(doctors: snapshot.data);
                      } else {
                        return Text("there is no data");
                      }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadLineText(
                    text: "العيادات",
                    lineHeight: 1,
                    color: IsDark
                        ? MainDarkColors.primaryFontColor
                        : MainLiteColors.primaryFontColor,
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
                          Get.to(MoreClinicsScreen());
                        },
                        child: SubText(text: "المزيد")),
                  )
                ],
              ),
              FutureBuilder(
                future: get_clinics(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return WaitingCarousel();
                    case ConnectionState.done:
                    default:
                      if (snapshot.hasError) {
                        return SomethingWentWrong();
                      } else if (snapshot.hasData) {
                        return HomeCard(
                          info: snapshot.data,
                          goToDoctor: false,
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
  final String url =
      '${siteUrl}api/doctor/doctors/isfeatured?per_page=12&page=1';
  print(url);
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
  });
  final body = doctorsFromJson(response.body).data;

  // ignore: unnecessary_cast
  List<HomeCardInfo> recievedDoctors = body
      .map(
        (e) => HomeCardInfo(
            title: e.fullName,
            subTitle: e.specialty?.title,
            image: "${siteUrl}${e.images}",
            id: e.id),
      )
      .toList();

  return recievedDoctors as List<HomeCardInfo>;
}

Future<List<HomeCardInfo>> get_clinics() async {
  final String url = '${siteUrl}api/clinic/all?per_page=12&page=1';

  var response = await http.get(Uri.parse(url));

  final List<HomeCardInfo> result =
      clinicsFromJson(response.body).data.map((e) {
    return HomeCardInfo(
        id: e.id.toString(),
        image: '${siteUrl}/media/${e.images}',
        title: e.name,
        subTitle: "");
  }).toList();

  return result;
}
