import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app/main.dart';

import '../../main_colors.dart';

class SearchScreen extends StatelessWidget {
  final Rx<bool> isSubmitted;

  SearchScreen({
    Key? key,
    required this.isSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return isSubmitted.value
          ? Container()
          : Expanded(
              child: Container(
              color: IsDark ? MainDarkColors.bgColor : MainLiteColors.bgColor,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset('Assets/Lottie json/search.json')
                ],
              ),
            ));
    });
  }
}
