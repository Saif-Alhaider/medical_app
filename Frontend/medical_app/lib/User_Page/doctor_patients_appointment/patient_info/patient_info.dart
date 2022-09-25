import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
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
                      children: const [
                        Expanded(
                            child: SubText(
                          text: "الاسم: محمد الموسوي",
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
                          "الحساب: saifalhaider@gmail.com",
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
                padding: EdgeInsets.all(18),
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
                      children: const [
                        Expanded(
                            child: SubText(
                          text: "الجنس:",
                          size: 30,
                          textAlign: TextAlign.right,
                          color: Colors.black,
                        )),
                        Expanded(
                            child: SubText(
                          text: "ذكر",
                          size: 30,
                          textAlign: TextAlign.left,
                          color: Colors.black,
                        ))
                      ],
                    ),
                    ConstantValues.cardsGap,
                    Breakline(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                            child: SubText(
                          text: "العمر:",
                          size: 30,
                          textAlign: TextAlign.right,
                          color: Colors.black,
                        )),
                        Expanded(
                            child: SubText(
                          text: "19",
                          size: 30,
                          textAlign: TextAlign.left,
                          color: Colors.black,
                        ))
                      ],
                    ),
                    Breakline(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                            child: SubText(
                          text: "فصيلة الدم:",
                          size: 30,
                          textAlign: TextAlign.right,
                          color: Colors.black,
                        )),
                        Expanded(
                            child: SubText(
                          text: "A+",
                          size: 30,
                          textAlign: TextAlign.left,
                          color: Colors.black,
                        ))
                      ],
                    ),
                    Breakline(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                            child: SubText(
                          text: "الطول:",
                          size: 30,
                          textAlign: TextAlign.right,
                          color: Colors.black,
                        )),
                        Expanded(
                            child: SubText(
                          text: "180cm",
                          size: 30,
                          textAlign: TextAlign.left,
                          color: Colors.black,
                        ))
                      ],
                    ),
                    Breakline(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Expanded(
                            child: SubText(
                          text: "الوزن:",
                          size: 30,
                          textAlign: TextAlign.right,
                          color: Colors.black,
                        )),
                        Expanded(
                            child: SubText(
                          text: "71kg",
                          size: 30,
                          textAlign: TextAlign.left,
                          color: Colors.black,
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
