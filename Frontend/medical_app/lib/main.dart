import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/bottom_nav_bar.dart';

import 'package:get/get.dart';
import 'Home/home_main.dart';
import 'Main_View/main_view.dart';
import 'OnBoarding/onboarding_main.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome,));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: BottomNavBar(),

    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: showHome ?'/main':'/',
      routes: {
        '/': (context) => OnBoardingMain(),
        '/main': (context) => MainView()
      },
    );
  }
}
