import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/bottom_nav_bar.dart';
import 'Home/home_main.dart';
import 'OnBoarding/onboarding_main.dart';

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
    return MaterialApp(
      title: 'Material App',
      initialRoute: showHome ?'/home':'/',
      routes: {
        '/': (context) => OnBoardingMain(),
        '/home': (context) => BottomNavBar()
      },
    );
  }
}
