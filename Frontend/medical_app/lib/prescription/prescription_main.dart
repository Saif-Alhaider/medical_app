import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/User_Page/textfield/registerTextField.dart';
import 'package:medical_app/prescription/save_gallery.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/dashedLine.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../User_Page/health_info_register_page/description_info.dart';
import '../models/medicine_info.dart';
import 'doctor_clinic_info.dart';
import 'medicines_info.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class PrescriptionMain extends StatefulWidget {
  const PrescriptionMain({super.key});

  @override
  State<PrescriptionMain> createState() => _PrescriptionMainState();
}

class _PrescriptionMainState extends State<PrescriptionMain> {
  GlobalKey _qrKey = new GlobalKey();
  Uint8List? imageInMemory;
  String? imagePath;
  File? capturedFile;
  late File customFile;
  Rx<bool> isQr = Rx<bool>(false);
  List<MedicineDetails> medicines = [
    MedicineDetails(
      name: "اموكسوسلين",
      frequency: 3,
      takingTimes: [
        TakingTimes(
          timeOfDay: TimeOfDay(hour: 12, minute: 20),
          additionalInfo: "بعد الغداء",
        ),
        TakingTimes(
          timeOfDay: TimeOfDay(hour: 8, minute: 20),
          additionalInfo: "بعد العشاء",
        ),
        TakingTimes(
          timeOfDay: TimeOfDay(hour: 22, minute: 20),
        )
      ],
    ),
    MedicineDetails(
      name: "فلو اوت",
      frequency: 2,
      takingTimes: [
        TakingTimes(
          timeOfDay: TimeOfDay(hour: 12, minute: 20),
          additionalInfo: "بعد الغداء",
        ),
        TakingTimes(
          timeOfDay: TimeOfDay(hour: 8, minute: 20),
          additionalInfo: "بعد العشاء",
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: ConstantValues.cardShadow,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadLineText(
                                  text: "الراجيتة",
                                  lineHeight: 1,
                                  size: 35,
                                  color: Colors.black,
                                ),
                                LottieBuilder.asset(
                                  "Assets/Lottie json/receipt.json",
                                  height: 100,
                                  repeat: false,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 200,
                              child: Breakline(
                                color: Color(0xff9D9D9D),
                              ),
                            )
                          ],
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        DoctorClinicInfo(),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        const HeadLineText(
                          text: "الادوية",
                        ),
                        MedicinesInfo(medicineInfo: medicines),
                        DashedLine(),
                        const HeadLineText(text: "ملاحظات"),
                        DescriptionInfo(
                          controller: TextEditingController(),
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        DashedLine(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HeadLineText(text: "رمز ال QR"),
                                  SizedBox(
                                      width: double.maxFinite,
                                      height: 60,
                                      child: MainButton(
                                        onPressed: () {
                                          isQr.value = true;
                                        },
                                        buttonTitle: "توليد رمز QR",
                                      )),
                                  ConstantValues.cardsGap,
                                  SizedBox(
                                      width: double.maxFinite,
                                      height: 60,
                                      child: MainButton(
                                        onPressed: () {
                                          capturePng(key: _qrKey,capturedFile: capturedFile,imagePath: imagePath);
                                        },
                                        buttonTitle: "حفظ الرمز",
                                        buttonColor: Colors.transparent,
                                        titleColor: Color(0xff9d9d9d),
                                        stroke: true,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        ConstantValues.cardsGap,
                        Obx(() => Center(
                              child: isQr.value
                                  ? RepaintBoundary(
                                      key: _qrKey,
                                      child: Container(
                                        color: Colors.white,
                                        child: QrImage(
                                          data: getMedicineInfo(medicines),
                                          version: QrVersions.auto,
                                          // size: 200.0,
                                        ),
                                      ),
                                    )
                                  : Lottie.asset(
                                      'Assets/Lottie json/qr-code-scanner.json',
                                      height: 200),
                            ))
                      ],
                    ),
                  ),
                  ConstantValues.cardsGap,
                  MainButton(onPressed: () {}, buttonTitle: 'حفظ الراجيتة')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String getMedicineInfo(List<MedicineDetails> medicines) {
  Map info = {};
  for (MedicineDetails medicine in medicines) {
    info['name'] = medicine.name;
    info['frequency'] = medicine.frequency;
    info['taking times'] = medicine.timesinfo;
  }
  return info.toString();
}
