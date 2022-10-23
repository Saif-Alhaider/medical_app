import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/view/reuseable_widgets/hold_on_animation.dart';
import 'package:medical_app/Controller/auth/auth_service.dart';
import 'package:medical_app/view/theme/main_colors.dart';
import 'package:medical_app/view/reuseable_widgets/main_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Main_View/main_view.dart';
import '../../../../main.dart';
import '../../../reuseable_widgets/texts_types/headline_text.dart';
import '../../../reuseable_widgets/registerTextField.dart';

import 'loginValidationDetails.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Rx<bool> waitButton = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: IsDark?MainDarkColors.bgColor:MainLiteColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LottieBuilder.asset(
                  'Assets/Lottie json/login.json',
                  height: 400,
                  repeat: true,
                  reverse: true,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RegisterTextField(
                          hintText: 'البريد الالكتروني',
                          controller: email,
                          // validate: emailValidation.value,
                          // errormsg: emailErrorMsg,
                          validator: (p0) {
                            if (p0 != null) {
                              bool emailValidator = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(p0);
                              return emailValidator == false
                                  ? "الايميل غير صحيح"
                                  : null;
                            }
                          }),
                      const SizedBox(height: 10),
                      RegisterTextField(
                        hintText: 'كلمة السر',
                        controller: password,
                        // validate: passwordValidation.value,
                        // errormsg: passwordErrorMsg,
                        isPrivate: true,
                        validator: (p0) {
                          if (p0 != null) {
                            if (p0.isEmpty) {
                              return "الرجاء كتابة الرمز السري";
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                ConstantValues.cardsGap,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.maxFinite,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue),
                    child: Obx(() => MainButton(
                        buttonTitle:
                            waitButton.value ? "انتظر..." : "تسجيل الدخول",
                        onPressed: () async {
                          waitButton.value = !waitButton.value;
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          AuthServic.login(
                                  email: email.text, password: password.text)
                              .then((response) async {
                                waitButton.value = !waitButton.value;
                            Map res = jsonDecode(response.body);
                            if (response.statusCode == 200) {
                              var prefs = await SharedPreferences.getInstance();
                              final String token = res['token']['access_token'];
                              prefs.setString('token', token);
                              String? fullName =
                                  "${res['profile']['first_name']} ${res['profile']['last_name']}";
                              prefs.setString('fullName', fullName);
                              prefs.setString(
                                  'account_id', res['profile']['id']);
                              prefs.setString(
                                  'account_type_id', res['profile_id']);
                              prefs.setString('account_type',
                                  res['profile']['account_type']);
                              
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HoldOnAnimation(
                                      animationDirectory:
                                          'Assets/Lottie json/login_success.json',
                                      whenItEnds: () =>
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MainView(),
                                              ),
                                              (route) => false),
                                    ),
                                  ),
                                  (route) => false);
                              password.clear();
                              email.clear();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar( SnackBar(
                                content: Text(
                                    "Welcome Back ${fullName} !"),
                                backgroundColor: MainLiteColors.foreignGreen,
                              ));
                            } else if (response.statusCode == 404) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "there is no such user please try again"),
                                backgroundColor: MainLiteColors.foreignRed,
                              ));
                              
                            }
                          });
                        })),
                  ),
                ),
                SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TextButton(
//                     onPressed: () async {
//                       if (!_formKey.currentState!.validate()) {
//                         return;
//                       }
//                       final Rx<bool> userFound = Rx<bool>(false);
//                       for (UserAccount user in User.users) {
//                         if (email.text == user.email &&
//                             password.text == user.password) {
//                           final prefs = await SharedPreferences.getInstance();
//                           prefs.setString('userEmail', email.text);
//                           prefs.setString('userPassword', password.text);
//                           userFound.value = true;
//                           // ignore: use_build_context_synchronously
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HoldOnAnimation(
                          //         animationDirectory:
                          //             'Assets/Lottie json/login_success.json',
                          //         whenItEnds: () => Navigator.pushReplacement(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => MainView(),
                          //             ),),
                          //       ),
                          //     ));
//                         }
//                       }
//                       if (userFound.value == false) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: const Text('there is no such user '),
//                           ),
//                         );
//                       }
//                       // loginTohome(
//                       //     context: context, email: email, password: password);
//                     },
//                     child: const HeadLineText(
//                       text: 'تسجيل الدخول',
//                       lineHeight: 1,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                   )