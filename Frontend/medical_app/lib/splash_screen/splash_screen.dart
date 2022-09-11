import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Home/bottom_nav_bar.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("طبيبي",style: TextStyle(color: Color(0xff2196F3),fontSize: 32),),
      ),
    );
  }
}
