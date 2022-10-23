import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/home_main.dart';
import '../User_Page/Register/registerEmail.dart';
import '../User_Page/loged_user_page/user_page.dart';
import '../../main.dart';
import '../../main_colors.dart';
import 'bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // final List pages = [Home(), Medicines()];
  final List pages = [Home()];
  Future<Null> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final full_name = prefs.getString("fullName");
    final role = prefs.getString("role");
    prefs.getString('token') == null
        ? pages.insert(1, RegisterEmail())
        : pages.insert(1, UserPage(full_name:full_name,role: role,));

    if (pages[1] == UserPage(full_name:full_name,role: role) && prefs.getString('token') == null) {
      pages[1] = RegisterEmail();
    }
  }

  Rx<int> currentIndex = Rx<int>(0);

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
      getUserData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: IsDark? MainDarkColors.bgColor:MainLiteColors.bgColor,
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          currentIndex.value = index;
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomSalamonNavigationBar(
        currentIndex: currentIndex,
        pageController: pageController,
      ),
    );
  }
}
