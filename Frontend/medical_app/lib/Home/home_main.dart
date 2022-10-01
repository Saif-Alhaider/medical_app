import 'package:flutter/material.dart';
import 'package:medical_app/Home/home_content/home_content.dart';
import 'package:medical_app/Home/searchBar.dart';
import 'package:medical_app/Home/search_screen.dart';
import 'package:medical_app/Home/welcome_section.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../main_colors.dart';
import '../models/user_model/account_model.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Rx<bool> searchPageDisplay = Rx<bool>(false);
  final Rx<bool> isSubmitted = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:IsDark?MainDarkColors.bgColor:MainLiteColors.bgColor,
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                const WelcomeSection(),
                const SizedBox(height: 15),
                Expanded(
                  child: Stack(
                    children: [
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: searchPageDisplay.value
                              ? SearchScreen(isSubmitted: isSubmitted,)
                              :  HomeContent(),
                        );
                      }),
                      SearchBar(searchPageDisplay: searchPageDisplay,isSubmitted: isSubmitted),
                    ],
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
