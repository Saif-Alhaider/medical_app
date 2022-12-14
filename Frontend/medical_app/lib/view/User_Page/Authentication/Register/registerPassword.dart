import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/view/User_Page/Authentication/Register/health_info_register_page/health_info_main.dart';
import 'package:medical_app/Controller/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Main_View/main_view.dart';
import '../../../../main.dart';
import '../../../theme/main_colors.dart';
import '../../../reuseable_widgets/back_Icon.dart';
import '../../../reuseable_widgets/main_button.dart';
import '../../../reuseable_widgets/texts_types/headline_text.dart';
import '../../../reuseable_widgets/hold_on_animation.dart';
import '../../../reuseable_widgets/registerTextField.dart';
import 'validationDetatils.dart';
import 'package:get/get.dart';

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
    final Rx<bool> waitingRegister = Rx<bool>(false);
    return Scaffold(
      backgroundColor: IsDark?MainDarkColors.bgColor:MainLiteColors.bgColor,
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: HeadLineText(text: "?????????? ???????? ????",color: IsDark? MainDarkColors.primaryFontColor:MainLiteColors.primaryFontColor,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RegisterTextField(
                        hintText: '???????? ????????',
                        controller: password,
                        isPrivate: true,
                        validator: (p0) => null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterTextField(
                        hintText: '?????????? ???????? ????????',
                        controller: confirmPassword,
                        // validate: passwordValidation.value,
                        // errormsg: passwordErrorMsg,
                        isPrivate: true,
                        validator: (p0) {
                          if (password.text.isEmpty ||
                              confirmPassword.text.isEmpty) {
                            return "???????????? ??????????????????????";
                          } else if (password.text != confirmPassword.text) {
                            return "?????????? ???????? ?????? ??????????????";
                          } else if (password.text.length <= 8 ||
                              confirmPassword.text.length <= 8) {
                            return "???????? ???????? ??????????";
                          }
                        },
                      ),
                    ],
                  ),
                ),

                ConstantValues.cardsGap,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Obx(() => MainButton(
                        buttonTitle: waitingRegister.value
                            ? "...??????????"
                            : '?????????? ???????? ????????',
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          
                          // User().addUser(UserAccount(
                          //   firstName: firstName.text,
                          //   lastName: lastName.text,
                          //   email: email.text,
                          //   password: password.text,
                          // ));
                          await AuthServic.register(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  email: email.text,
                                  password: password.text,
                                  confirmPassword: confirmPassword.text,
                                  account_type: "patient")
                              .then(
                            (res) async {
                              final String token = res['token']['access_token'];
                              var prefs = await SharedPreferences.getInstance();
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
                                  waitingRegister.value = true;
                              firstName.clear();
                              lastName.clear();
                              email.clear();
                              password.clear();
                              confirmPassword.clear();

                              // ignore: use_build_context_synchronously
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
                                          builder: (context) =>
                                              HealthInfoRegister(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
