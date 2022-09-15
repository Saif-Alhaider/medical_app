


import 'package:flutter/material.dart';

import 'package:medical_app/OnBoarding/start_button.dart';


import '../models/onboarding_models/onboarding_details.dart';
import '../reuseable_widgets/texts_types/headline_text.dart';
import '../reuseable_widgets/texts_types/sub_text.dart';
import 'circle_indicators.dart';
import 'indicator_section.dart';

class OnBoardingMain extends StatefulWidget {

 const OnBoardingMain({Key? key}) : super(key: key);


  @override
  State<OnBoardingMain> createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  final _pageViewController = PageController();
  static bool isLastPage = false;
  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            isLastPage = value == Details.animations.length - 1;
          });
        },
        controller: _pageViewController,
        itemCount: Details.headlines.length,
        itemBuilder: (context, index) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 300,width: 400,child: Details.animations[index],),
                    HeadLineText(text: Details.headlines[index]),
                    SubText(text: Details.subTexts[index])
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        color: const Color(0xFFf6f6f6),
        height: 120,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CircleIndicators(controller: _pageViewController,),
            ),
            isLastPage
                ? StartButton(controller: _pageViewController)
                :IndicatorSection(controller: _pageViewController),
          ],
        ),
      ) ,
    );
  }

  
  
}
