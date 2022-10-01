import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/models/patient_info.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../reuseable_widgets/waiting.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xfff6f6f6),
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
                                    color: Colors.black,
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
                                    style: GoogleFonts.vazirmatn(fontSize: 18),
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
                              color: Colors.white,
                              boxShadow: ConstantValues.cardShadow,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                      child: SubText(
                                    text: "الجنس:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: Colors.black,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text: snapshot.data!.userHealthInfo.gender,
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                              ConstantValues.cardsGap,
                              const Breakline(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Expanded(
                                      child: SubText(
                                    text: "العمر:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: Colors.black,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text: snapshot.data!.userHealthInfo.age
                                        .toString(),
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                              const Breakline(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Expanded(
                                      child: SubText(
                                    text: "فصيلة الدم:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: Colors.black,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text: snapshot
                                        .data!.userHealthInfo.blood_type,
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                              const Breakline(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                      child: SubText(
                                    text: "الطول:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: Colors.black,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text:
                                        '${snapshot.data!.userHealthInfo.height}cm',
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                              const Breakline(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Expanded(
                                      child: SubText(
                                    text: "الوزن:",
                                    size: 30,
                                    textAlign: TextAlign.right,
                                    color: Colors.black,
                                  )),
                                  Expanded(
                                      child: SubText(
                                    text:
                                        '${snapshot.data!.userHealthInfo.weight}kg',
                                    size: 30,
                                    textAlign: TextAlign.left,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        ConstantValues.cardsGap,
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          height: 200,
                          width: double.maxFinite,
                          child: Expanded(
                              child: Text(
                            snapshot.data!.userHealthInfo.description == ""
                                ? "لا توجد ملاحظات"
                                : "",
                            style: GoogleFonts.vazirmatn(fontSize: 20),
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
      "http://10.0.2.2:8000/api/doctor/doctor_patient_info?user_id=$id";
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
