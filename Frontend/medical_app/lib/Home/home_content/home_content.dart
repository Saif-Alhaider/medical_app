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

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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
              DoctorsCards(),
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
              DoctorsCards(),
            ],
          )
        ],
      ),
    );
  }
}
