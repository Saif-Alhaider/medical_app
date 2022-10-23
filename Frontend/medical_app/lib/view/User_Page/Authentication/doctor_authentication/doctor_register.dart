import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DoctorRegister extends StatelessWidget {
  const DoctorRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            LottieBuilder.asset('Assets/Lottie json/doctor_register.json',repeat: false,)
          ],
        ),
      ),
    );
  }
}
