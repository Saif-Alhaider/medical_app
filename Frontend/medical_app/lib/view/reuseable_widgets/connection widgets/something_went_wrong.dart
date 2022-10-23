import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.maxFinite,
      child: Column(
        children: [
          LottieBuilder.asset('Assets/Lottie json/connection_lost.json',height: 200,),
          SubText(text: "حدثت مشكلة الرجاء المحاولة لاحقاً")
        ],
      ),
    );
  }
}
