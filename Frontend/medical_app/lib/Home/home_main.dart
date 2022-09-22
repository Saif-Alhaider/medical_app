import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:medical_app/Home/search_screen.dart';
import 'package:medical_app/Home/widgets/cards/card_of_clinc.dart';
import 'package:medical_app/Home/widgets/catogaries.dart';
import 'package:medical_app/Home/widgets/doctors.dart';
import 'package:medical_app/Home/widgets/my_text-field.dart';
import 'package:medical_app/Home/widgets/search_bar.dart';
import 'package:medical_app/Home/widgets/special_doctors.dart';
import 'package:medical_app/Home/widgets/title_of_section.dart';
import '../models/home_page/card_clinc_model.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

import 'package:medical_app/Home/home_content/home_content.dart';
import 'package:medical_app/Home/searchBar.dart';
import 'package:medical_app/Home/search_screen.dart';
import 'package:medical_app/Home/welcome_section.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model/account_model.dart';
import 'package:get/get.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Rx<bool> searchPageDisplay = Rx<bool>(false);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primaryTextColor = Colors.black;
  final Color seconderyTextColor = Colors.grey;
  final Rx<bool> searchPageDisplay = Rx<bool>(false);
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: Image.asset(
                    "Assets/images/MortadhaEmad.jpg",
                  ).image,
                  backgroundColor: Colors.transparent,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "اهلا مرتضى",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "ابحث عن طبيب او عيادة ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 1.571,
            child: ListView(
              children: [
                SearchBar(searchPageDisplay: searchPageDisplay,),
                Text(
                  "التخصصات",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Catocaries(),
                TItalOfSection(
                  mainText: 'اشهر الاطباء',
                  secondText: 'عرض الكل',
                ),
                const Doctors(),
                TItalOfSection(
                  mainText: 'اطباء متميزون',
                  secondText: 'عرض الكل',
                ),
                SpecialDoctors(),
               // Clincs(),
                CardOfClinc(clinc:ClincList[0],),
                CardOfClinc(clinc:ClincList[0],),

              ],
            ),
          )
        ],
      ),
    ));
  }
}


    return Scaffold(
      backgroundColor: Colors.white,
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
                              ? const SearchScreen()
                              : const HomeContent(),
                        );
                      }),
                      SearchBar(searchPageDisplay: searchPageDisplay),
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
