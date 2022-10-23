import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/view/Main_View/main_view.dart';
import 'package:medical_app/view/User_Page/Authentication/Register/health_info_register_page/drop_down_blood_type.dart';
import 'package:medical_app/Controller/auth/auth_service.dart';
import 'package:medical_app/view/reuseable_widgets/next_skip_buttons.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../OnBoarding/indicators_button.dart';
import '../add_image_register.dart';
import 'description_info.dart';
import 'gender_card.dart';
import 'info_card.dart';

class HealthInfoRegister extends StatelessWidget {
  final TextEditingController hegihtController =
      TextEditingController(text: "63");
  final TextEditingController weightController =
      TextEditingController(text: "60");
  final TextEditingController ageController = TextEditingController(text: "18");
  final TextEditingController descriptionController = TextEditingController();
  Rx<String> bloodType = Rx<String>("");
  HealthInfoRegister({super.key});

  static final Rx<bool> maleSelection = Rx<bool>(false);
  static final Rx<bool> femaleSelection = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              LottieBuilder.asset("Assets/Lottie json/health-checkup.json"),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => GestureDetector(
                          onTap: () {
                            femaleSelection.value = !femaleSelection.value;
                            femaleSelection.value
                                ? maleSelection.value = false
                                : maleSelection.value = true;
                          },
                          child: GenderCard(
                            flag: femaleSelection.value,
                            svgPictur:
                                SvgPicture.asset("Assets/svg/female.svg"),
                            color: const Color(0xffEF4FD5),
                            title: "انثى",
                          ),
                        )),
                  ),
                  ConstantValues.cardsGap,
                  Expanded(
                    child: Obx(() => GestureDetector(
                          onTap: () {
                            maleSelection.value = !maleSelection.value;
                            maleSelection.value
                                ? femaleSelection.value = false
                                : femaleSelection.value = true;
                          },
                          child: GenderCard(
                            flag: maleSelection.value,
                            svgPictur: SvgPicture.asset("Assets/svg/male.svg"),
                            color: const Color(0xff09B5FF),
                            title: "ذكر",
                          ),
                        )),
                  )
                ],
              ),
              ConstantValues.cardsGap,
              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      controller: weightController,
                      title: "الوزن",
                      unit: "kg",
                    ),
                  ),
                  ConstantValues.cardsGap,
                  Expanded(
                    child: InfoCard(
                      controller: hegihtController,
                      title: "الطول",
                      unit: "cm",
                    ),
                  )
                ],
              ),
              ConstantValues.cardsGap,
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    ConstantValues.cardsGap,
                    Expanded(
                        child: InfoCard(
                            controller: ageController,
                            title: "العمر",
                            unit: "")),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 60,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropDownBloodType(bloodType: bloodType),
                      ),
                    ),
                  )
                ],
              ),
              ConstantValues.cardsGap,
              DescriptionInfo(controller: descriptionController),
              ConstantValues.cardsGap,
              ConstantValues.cardsGap,
              NextSkipButtons(nextFunction: () async {
                var pref = await SharedPreferences.getInstance();
                String? token = pref.getString('token');
                String? account_type_id = pref.getString('account_type_id');
                AuthServic.sendHealthInfo(
                  token: token!,
                  gender: maleSelection.value ? "MALE" : "FEMALE",
                  age: int.tryParse(ageController.text),
                  height: int.parse(hegihtController.text),
                  weight: int.parse(weightController.text),
                  blood_type: bloodType.value,
                  description: descriptionController.text,
                  patient_id: account_type_id!,
                ).then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddUserImage(),
                      ),
                      (route) => false);
                });
              }, skipFunction: () async {
                var pref = await SharedPreferences.getInstance();
                String? token = pref.getString('token');
                String? account_id = pref.getString('account_id');
                AuthServic.sendHealthInfo(
                  token: token!,
                  patient_id: account_id!,
                ).then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddUserImage(),
                      ),
                      (route) => false);
                });
              }),
              ConstantValues.cardsGap,
              ConstantValues.cardsGap,
            ],
          ),
        ),
      ),
    );
  }
}
