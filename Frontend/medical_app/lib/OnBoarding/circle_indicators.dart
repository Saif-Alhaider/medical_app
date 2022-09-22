import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboarding_models/onboarding_details.dart';

class CircleIndicators extends StatelessWidget {
  final PageController controller;
  const CircleIndicators({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
                      controller: controller,
                      count: Details.animations.length,
                      
                      effect: const ExpandingDotsEffect(
                          dotColor: Color(0xffD9D9D9),
                          activeDotColor: Colors.blue,
                          dotWidth: 12,
                          dotHeight: 12),
                    );
  }
}
