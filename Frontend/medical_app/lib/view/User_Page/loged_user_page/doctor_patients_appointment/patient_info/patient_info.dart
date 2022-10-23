import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/models/patient_info.dart';
import 'package:medical_app/view/reuseable_widgets/break_line.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../main.dart';
import '../../../../../main_colors.dart';
import '../../../../reuseable_widgets/waiting.dart';
import 'package:get/get.dart';

class PatientInfo extends StatelessWidget {
  final int userId;

  const PatientInfo({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getUserinfo(
      id: userId,
    );
    return Scaffold(
      backgroundColor: IsDark ? MainDarkColors.bgColor : MainLiteColors.bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: IsDark
                ? MainDarkColors.primaryFontColor
                : MainLiteColors.primaryFontColor,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor:
            IsDark ? MainDarkColors.bgColor : MainLiteColors.bgColor,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder(
            future: getUserinfo(
              id: userId,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Waiting();
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    return const Text("something went wrong");
                  } else if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.maxFinite,
                          // height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: ConstantValues.cardShadow,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: SubText(
                                    text: "الاسم: ${snapshot.data!.fullName}",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  )),
                                ],
                              ),
                              ConstantValues.cardsGap,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SelectableText(
                                    "الحساب: ${snapshot.data!.email}",
                                    style: GoogleFonts.vazirmatn(
                                      fontSize: 18,
                                      color: IsDark
                                          ? MainDarkColors.primaryFontColor
                                          : MainLiteColors.primaryFontColor,
                                    ),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        const HeadLineText(
                          text: "المعلومات الصحية",
                          color: Colors.blue,
                        ),
                        Container(
                          padding: const EdgeInsets.all(18),
                          width: double.maxFinite,
                          // height: 80,
                          decoration: BoxDecoration(
                              color: IsDark
                                  ? MainDarkColors.bgColor
                                  : MainLiteColors.bgColor,
                              boxShadow: ConstantValues.cardShadow,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: SubText(
                                    text: "الجنس:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text: snapshot.data!.userHealthInfo.gender,
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  ))
                                ],
                              ),
                              ConstantValues.cardsGap,
                              Breakline(
                                color: IsDark
                                    ? MainDarkColors.primaryFontColor
                                    : MainLiteColors.primaryFontColor,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SubText(
                                    text: "العمر:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text: snapshot.data!.userHealthInfo.age
                                        .toString(),
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  ))
                                ],
                              ),
                              const Breakline(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SubText(
                                    text: "فصيلة الدم:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text: snapshot
                                        .data!.userHealthInfo.blood_type,
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  ))
                                ],
                              ),
                              Breakline(
                                color: IsDark
                                    ? MainDarkColors.primaryFontColor
                                    : MainLiteColors.primaryFontColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: SubText(
                                    text: "الطول:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text:
                                        '${snapshot.data!.userHealthInfo.height}cm',
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  ))
                                ],
                              ),
                              const Breakline(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SubText(
                                    text: "الوزن:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text:
                                        '${snapshot.data!.userHealthInfo.weight}kg',
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: IsDark
                                        ? MainDarkColors.primaryFontColor
                                        : MainLiteColors.primaryFontColor,
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        ConstantValues.cardsGap,
                        Container(
                          padding: EdgeInsets.all(10),
                          color: IsDark
                              ? MainDarkColors.bgColor
                              : MainLiteColors.bgColor,
                          height: 200,
                          width: double.maxFinite,
                          child: Expanded(
                              child: Text(
                            snapshot.data!.userHealthInfo.description == ""
                                ? "لا توجد ملاحظات"
                                : "",
                            style: GoogleFonts.vazirmatn(
                              fontSize: 20,
                              color: IsDark
                                  ? MainDarkColors.primaryFontColor
                                  : MainLiteColors.primaryFontColor,
                            ),
                          )),
                        )
                      ],
                    );
                  } else {
                    return const Text("there is not data");
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<UserPersonalInfo>? getUserinfo({required int id}) async {
  var prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  final String url =
      "${siteUrl}api/doctor/doctor_patient_info?user_id=$id";
  var response = await http.get(Uri.parse(url), headers: {
    "Content-Type": "application/json",
    'Authorization': 'Bearer $token',
  });
  var result = jsonDecode(response.body);
  result = UserPersonalInfo(
      fullName: result['fullName'],
      email: result['email'],
      userHealthInfo: UserHealthInfo(
          age: result['health_info']['age'],
          blood_type: result['health_info']['blood_type'],
          gender: result['health_info']['gender'] == "M" ? "ذكر" : "انثى",
          height: result['health_info']['height'],
          weight: result['health_info']['weight'],
          description: result['health_info']['description']));
  return result;
}
