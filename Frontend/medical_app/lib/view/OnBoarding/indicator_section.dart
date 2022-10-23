import 'package:flutter/material.dart';
import 'package:medical_app/view/reuseable_widgets/next_skip_buttons.dart';

import '../../models/onboarding_models/onboarding_details.dart';
import 'circle_indicators.dart';
import 'indicators_button.dart';

class IndicatorSection extends StatelessWidget {
  final PageController controller;
  const IndicatorSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 90,
      child: NextSkipButtons(skipFunction: jumpTolastPage, nextFunction: nextPage),
    );
  }

  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void jumpTolastPage() => controller.jumpToPage(Details.animations.length - 1);
}

// IndicatorsButton(onPressed: nextPage, title: 'التالي'),

// IndicatorsButton(title: 'تخطي',onPressed: jumpTolastPage),