import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/view/reuseable_widgets/registerTextField.dart';
import 'package:http/http.dart' as http;
import 'package:medical_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/Patient.dart';
import '../../../reuseable_widgets/waiting.dart';
import '../../Authentication/Register/validationDetatils.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    get_user_info();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: get_user_info(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Waiting();
              case ConnectionState.done:
              default:
                if (snapshot.hasError) {
                  return Text("error");
                } else if (snapshot.hasData) {
                  return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LottieBuilder.asset('Assets/Lottie json/edit-document.json'),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RegisterTextField(
                        hintText: 'اسم العائلة',
                        controller: TextEditingController(text: snapshot.data!.lastName),
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RegisterTextField(
                          hintText: "الاسم الاول",
                          controller: TextEditingController(text: snapshot.data!.firstName),
                          validator: (p0) {
                            if (p0 != null) {
                              if (p0.isEmpty) {
                                return 'الاسم الاول لا يجب ان يكون فارغ';
                              } else if (p0.length <= 2) {
                                return 'الاسم قصير';
                              }
                            }
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextField(
                  hintText: "البريد الالكتروني",
                  controller: TextEditingController(text: snapshot.data!.email),
                  validator: (p0) => emailValidation(p0),
                ),
              ],
            )
          ],
        );
                }else{
                  return Text("حدثت مشكلة");
                }
            }
          },
        ),
      ),
    );
  }
}

Future<Patient> get_user_info() async {
  var prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  final url = "${siteUrl}api/account/me";
  var response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
  Patient patient = patientFromJson(response.body);
  return patient;
}
