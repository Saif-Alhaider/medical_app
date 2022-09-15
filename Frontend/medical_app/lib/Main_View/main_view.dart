import 'package:flutter/material.dart';
import 'package:medical_app/doctor_page/doctor_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Appointments/ScheduleTab.dart';
import '../Home/home_main.dart';
import '../User_Page/Login/login_main.dart';
import '../User_Page/Register/registerEmail.dart';
import '../User_Page/health_info_register_page/health_info_main.dart';
import '../User_Page/loged_user_page/user_page.dart';
import 'bottom_navigation_bar.dart';

class MainView extends StatefulWidget {

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
   final List pages = [Home(),ScheduleTab()];
  Future<Null> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('userEmail')==null?pages.insert(2, RegisterEmail()):pages.insert(2, UserPage());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
 

  Rx<int> currentIndex = Rx<int>(0);

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          currentIndex.value = index;
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return pages[index];
          // return Notifications();
        },
      ),
      bottomNavigationBar: BottomSalamonNavigationBar(currentIndex: currentIndex,pageController: pageController,),
    );
  }
}
