import 'package:flutter/material.dart';
import 'package:medical_app/Main_View/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'OnBoarding/onboarding_main.dart';
import 'User_Page/loged_user_page/profile details/profile_details.dart';

bool IsDark =true ;
RxBool isDark=true.obs;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:ProfileDetails(),
    );
  }
}
