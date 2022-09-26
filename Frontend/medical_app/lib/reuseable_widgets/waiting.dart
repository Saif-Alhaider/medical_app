import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Waiting extends StatelessWidget {
  const Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 300, child: Lottie.asset('Assets/Lottie json/loading.json')),
    );
  }
}
