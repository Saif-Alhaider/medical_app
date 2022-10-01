import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/textfield/registerTextField.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';

import '../../Register/validationDetatils.dart';

class UserAccountInfo extends StatelessWidget {
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  const UserAccountInfo({super.key});

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
                  LottieBuilder.asset('Assets/Lottie json/edit-document.json'),
                  HeadLineText(text: "معلومات الحساب"),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(text: "الاسم الاول",size: 20,),
                            RegisterTextField(
                              hintText: "الاسم",
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
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(text: "اسم العائلة",size: 20,),
                            RegisterTextField(
                              hintText: "اسم العائلة",
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
                  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(text: "الحساب الالكتروني",size: 20,),
                            RegisterTextField(
                              hintText: "الحساب الالكتروني",
                              controller: firstNameController,
                              validator: (p0) => emailValidation(p0),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(text: "رقم الهاتف",size: 20,),
                            RegisterTextField(
                              hintText: "رقم الهاتف",
                              controller: firstNameController,
                              validator: (p0) => null,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(text: "كلمة السر",size: 20,),
                            RegisterTextField(
                              hintText: "كلمة السر",
                              controller: firstNameController,
                              validator: (p0) => null,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: MainButton(onPressed: ()=>null, buttonTitle: "تعديل"),
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
