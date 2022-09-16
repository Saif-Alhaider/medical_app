import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/auth/auth_service.dart';

import '../../Main_View/main_view.dart';
import '../../models/user_model/account_model.dart';
import '../../reuseable_widgets/back_Icon.dart';
import '../../reuseable_widgets/main_button.dart';
import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../hold_on_animation.dart';
import '../textfield/registerTextField.dart';
import 'validationDetatils.dart';

class RegisterPassword extends StatelessWidget {
  final TextEditingController firstName, lastName, email;
  const RegisterPassword({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);
  static final TextEditingController _password = TextEditingController();
  static final TextEditingController _confirmPassword = TextEditingController();

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // return back
                BackIcon(),
                // lottie widget
                Center(
                    child: SizedBox(
                        height: 350,
                        child: LottieBuilder.asset(
                            'Assets/Lottie json/signup.json'))),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: HeadLineText(text: "انشاء كلمة سر"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RegisterTextField(
                        hintText: 'كلمة السر',
                        controller: password,
                        isPrivate: true,
                        validator: (p0) => null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterTextField(
                        hintText: 'تأكيد كلمة السر',
                        controller: confirmPassword,
                        // validate: passwordValidation.value,
                        // errormsg: passwordErrorMsg,
                        isPrivate: true,
                        validator: (p0) {
                          if (password.text.isEmpty ||
                              confirmPassword.text.isEmpty) {
                            return "الرجاء ملىءالحقلين";
                          } else if (password.text != confirmPassword.text) {
                            return "كلمات السر غير متساوية";
                          } else if (password.text.length <= 8 ||
                              confirmPassword.text.length <= 8) {
                            return "كلمة السر ضعيفة";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: MainButton(
                    buttonTitle: 'انشاء حساب جديد',
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      User().addUser(UserAccount(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        email: email.text,
                        password: password.text,
                      ));
                      await AuthServic.register(
                              firstName: firstName.text,
                              lastName: lastName.text,
                              email: email.text,
                              password: password.text)
                          .then((res) {
                            final String token = res['token']['access'];
                        firstName.clear();
                        lastName.clear();
                        email.clear();
                        password.clear();
                        confirmPassword.clear();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HoldOnAnimation(
                              animationDirectory:
                                  'Assets/Lottie json/done.json',
                              whenItEnds: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainView(),
                                      
                                    ),
                                    (route) => false,
                                    );
                              },
                            ),
                          ),
                        );
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
