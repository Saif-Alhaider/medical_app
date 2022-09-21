import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/main.dart';
import '../Main_View/main_view.dart';
import '../main_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => Get.to(MainView()));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:IsDark?MainDarkColors.masterColor: Color(0xff2196F3) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "طبيبي",
                style: TextStyle(color:Colors.white , fontSize: 32),
              ),
            ),

            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                value: 0.8,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth:3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
