import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/User_Page/health_info_register_page/drop_down_blood_type.dart';
import 'package:medical_app/reuseable_widgets/next_skip_buttons.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';
import 'package:get/get.dart';
import '../../OnBoarding/indicators_button.dart';
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
    return SingleChildScrollView(
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
                          svgPictur: SvgPicture.asset("Assets/svg/female.svg"),
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
                )),
                ConstantValues.cardsGap,
                Expanded(
                    child: InfoCard(
                  controller: hegihtController,
                  title: "الطول",
                  unit: "cm",
                ))
              ],
            ),
            ConstantValues.cardsGap,
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
                ),
                ConstantValues.cardsGap,
                Expanded(
                    child: InfoCard(
                        controller: ageController, title: "العمر", unit: "")),
              ],
            ),
            ConstantValues.cardsGap,
            DescriptionInfo(controller: descriptionController),
            ConstantValues.cardsGap,
            NextSkipButtons(nextFunction: (){
              print("hello next");
            },skipFunction: (){print("hello next");}),
            
          ],
        ),
      ),
    );
  }
}
