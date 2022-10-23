import 'package:flutter/material.dart';

import '../OnBoarding/indicators_button.dart';

class NextSkipButtons extends StatelessWidget {
  final Function() skipFunction;
  final Function() nextFunction;
  const NextSkipButtons({
    Key? key,
    required this.skipFunction,
    required this.nextFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IndicatorsButton(
          title: 'تخطي',
          onPressed: skipFunction,
          buttonColor: Color(0xffCBE2F4),
          textColor: Color(0xff2196F3),
        ),
        IndicatorsButton(
          onPressed: nextFunction,
          title: 'التالي',
          textColor: Colors.white,
        ),
      ],
    );
  }
}
