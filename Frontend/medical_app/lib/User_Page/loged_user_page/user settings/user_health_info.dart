import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/textfield/registerTextField.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../../Register/validationDetatils.dart';

class UserHealthInfo extends StatelessWidget {
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  const UserHealthInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                  LottieBuilder.asset(
                      'Assets/Lottie json/health-insurance.json'),
                  HeadLineText(text: "المعلومات الصحية"),
                  // height and weghit
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: "الطول",
                              size: 20,
                            ),
                            RegisterTextField(
                              hintText: "الطول",
                              controller: firstNameController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: "الوزن",
                              size: 20,
                            ),
                            RegisterTextField(
                              hintText: "الوزن",
                              controller: firstNameController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  // blood type and gender
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: "فصيلة الدم",
                              size: 20,
                            ),
                            RegisterTextField(
                              hintText: "فصيلة الدم",
                              controller: firstNameController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: "الجنس",
                              size: 20,
                            ),
                            RegisterTextField(
                              hintText: "الجنس",
                              controller: firstNameController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: "العمر",
                              size: 20,
                            ),
                            RegisterTextField(
                              hintText: "العمر",
                              controller: firstNameController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Spacer(),
                    ],
                  ),
                  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: "ملاحظات عامة",
                              size: 20,
                            ),
                            RegisterTextField(description: true,
                              hintText: "ملاحظات عامة. اجريت عملية, لدي حساسية, اعاني من",
                              controller: firstNameController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              },
                            ),
                          ],
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child:
                        MainButton(onPressed: () => null, buttonTitle: "تعديل"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
