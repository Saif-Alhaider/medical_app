import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/models/doctor/doctors.dart';
import 'package:medical_app/models/home_card_info.dart';
import 'package:medical_app/view/reuseable_widgets/break_line.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../doctor_page/doctor_page.dart';
import '../../main.dart';
import '../theme/main_colors.dart';
import '../../models/doctors_images.dart';
import '../reuseable_widgets/home_card.dart';
import 'package:http/http.dart' as http;

import '../reuseable_widgets/waiting.dart';
import '../reuseable_widgets/connection widgets/waitingCarousel.dart';

class ClinicMain extends StatelessWidget {
  const ClinicMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: <Widget>[
            Container(
                color: IsDark
                    ? MainDarkColors.primaryCardColor
                    : MainLiteColors.primaryCardColor,
                width: double.maxFinite,
                height: 500,
                child: Image.asset(
                  'Assets/clinic/Rectangle546.png',
                  fit: BoxFit.cover,
                )),
            SlidingUpPanel(
              minHeight: 420,
              panelBuilder: (sc) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    controller: sc,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadLineText(
                                text: "?????????? ??????????",
                                color: IsDark
                                    ? MainDarkColors.primaryFontColor
                                    : MainLiteColors.primaryFontColor,
                              ),
                              SubText(
                                text: '????????????',
                                color: IsDark
                                    ? MainDarkColors.primaryFontColor
                                    : MainLiteColors.primaryFontColor,
                              ),
                              SubText(
                                text:
                                    '?????????? ?????? 2012 ???????? 4 ?????????? ???????? ?????????? ???????? ??????????',
                                textAlign: TextAlign.right,
                              )
                            ],
                          ),
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                Icon(
                                  Icons.pin_drop,
                                  size: 40,
                                  color: IsDark
                                      ? MainDarkColors.primaryFontColor
                                      : MainLiteColors.primaryFontColor,
                                ),
                                const SubText(
                                  text: "?????????? ,??????????????",
                                  color: Colors.blue,
                                )
                              ],
                            ),
                            ConstantValues.cardsGap,
                            Row(
                              children:  [
                                Icon(
                                  Icons.watch_later,
                                  size: 40,
                                  color: IsDark
                                      ? MainDarkColors.primaryFontColor
                                      : MainLiteColors.primaryFontColor,
                                ),
                                const SubText(
                                  text: "12:00PM - 09:00AM",
                                  color: Colors.blue,
                                )
                              ],
                            ),
                            ConstantValues.cardsGap,
                            Row(
                              children:  [
                                SubText(
                                  text: "?????? ??????????: ",
                                  color: IsDark
                                      ? MainDarkColors.primaryFontColor
                                      : MainLiteColors.primaryFontColor,
                                ),
                                const SubText(
                                  text: "30\$",
                                  color: Colors.blue,
                                )
                              ],
                            ),
                          ],
                        ),
                        ConstantValues.cardsGap,
                        Breakline(
                          color: Colors.grey,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 60,
                                  spreadRadius: 0.5,
                                  color: Color.fromARGB(23, 0, 0, 0))
                            ],
                          ),
                          height: 350,
                          child: FutureBuilder(
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
                                        const Icon(Icons.error),
                                        const Text(
                                            "something went wrong please try again later"),
                                        Text(snapshot.error.toString())
                                      ],
                                    );
                                  } else if (snapshot.hasData) {
                                    return HomeCard(
                                      info: snapshot.data,
                                      goToDoctor: true,
                                    );
                                  } else {
                                    return Text("there is no data");
                                  }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<List<HomeCardInfo>> get_doctors() async {
  final String url = '${siteUrl}api/doctor/doctors?page_num=1';
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
  });
  // final body = DoctorsFromJson(response.body).doctors;

  // // ignore: unnecessary_cast
  // List<HomeCardInfo> recievedDoctors = body
  //     .map(
  //       (e) => HomeCardInfo(
  //           title: e.fullName,
  //           subTitle: e.speciality,
  //           image: "http://10.0.2.2:8000/${e.image}",
  //           id: e.id),
  //     )
  //     .toList();

  // return recievedDoctors as List<HomeCardInfo>;
  return [];
}
