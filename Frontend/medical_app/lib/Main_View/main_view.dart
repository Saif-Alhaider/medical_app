import 'package:flutter/material.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Appointments/ScheduleTab.dart';
import '../Clinic/clinic_main.dart';
import '../Home/home_main.dart';
import '../User_Page/Login/login_main.dart';
import '../User_Page/Register/registerEmail.dart';
import '../User_Page/health_info_register_page/health_info_main.dart';
import '../User_Page/loged_user_page/user_page.dart';
import '../prescription/prescription_main.dart';
import 'bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List pages = [Home(), ScheduleTab()];
  Future<Null> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final full_name = prefs.getString("fullName");
    prefs.getString('token') == null
        ? pages.insert(2, RegisterEmail())
        : pages.insert(2, UserPage(full_name:full_name));

    if (pages[2] == UserPage(full_name:full_name) && prefs.getString('token') == null) {
      pages[2] = RegisterEmail();
    }
  }

  Rx<int> currentIndex = Rx<int>(0);

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
      getUserData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView.builder(
        
        controller: pageController,
        onPageChanged: (index) {
          currentIndex.value = index;
          setState(() {
            
          });
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return pages[index];
          // return ClinicMain();
        },
      ),
      bottomNavigationBar: BottomSalamonNavigationBar(
        currentIndex: currentIndex,
        pageController: pageController,
      ),
    );
  }
}
