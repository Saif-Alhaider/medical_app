import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/User_Page/Register/registerPassword.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';

import '../Login/login_main.dart';
import '../textfield/registerTextField.dart';
import 'validationDetatils.dart';
import 'package:get/get.dart';

class RegisterEmail extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SizedBox(
                height: 350,
                child: LottieBuilder.asset('Assets/Lottie json/signup.json'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "انشاء حساب جديد",
                style: GoogleFonts.vazirmatn(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: RegisterTextField(
                            hintText: 'اسم العائلة',
                            controller: lastName,
                            validator: (p0) {
                              if (p0 != null) {
                                if (p0.isEmpty) {
                                  return 'اسم العائلة لا يجب ان يكون فارغ';
                                } else if (p0.length <= 2) {
                                  return 'الاسم قصير';
                                }
                              }
                            },
                            // errormsg: lastNameErrorMsg,
                            // validate: lastNameValidation.value,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: RegisterTextField(
                          hintText: 'الاسم الاول',
                          controller: firstName,
                          validator: (p0) {
                            if (p0 != null) {
                              if (p0.isEmpty) {
                                return 'الاسم الاول لا يجب ان يكون فارغ';
                              } else if (p0.length <= 2) {
                                return 'الاسم قصير';
                              }
                            }
                          },
                          // validate: firstNameValidation.value,
                          // errormsg: firstNameErrorMsg,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RegisterTextField(
                      hintText: 'الحساب الالكتروني',
                      controller: email,
                      validator: (p0) => emailValidation(p0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'لديك حساب بالفعل؟',
                          style: GoogleFonts.vazirmatn(color: Colors.black),
                          children: [
                            const WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 10)),
                            TextSpan(
                                text: "تسجيل الدخول",
                                style:
                                    GoogleFonts.vazirmatn(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  }),
                          ]),
                    ),
                    const SizedBox(height: 20),
                    MainButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPassword(
                              firstName: firstName, //_firstName.text
                              lastName: lastName, //_lastName.text
                              email: email, //_email.text
                            ),
                          ),
                        );
                      },
                      buttonTitle: 'اكمال التسجيل',
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
