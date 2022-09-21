import 'package:flutter/material.dart';
import 'package:medical_app/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'OnBoarding/onboarding_main.dart';

bool IsDark=true;
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
    
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: showHome ?'/main':'/',
      routes: {
        '/': (context) => OnBoardingMain(),
        '/main': (context) => SplashScreen(),
      },
    );
  }
}
