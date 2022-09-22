import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Main_View/main_view.dart';

class HoldOnAnimation extends StatefulWidget {
  final Function() whenItEnds;
  final String animationDirectory;
  const HoldOnAnimation({
    Key? key,
    required this.whenItEnds,
    required this.animationDirectory,
  }) : super(key: key);

  @override
  State<HoldOnAnimation> createState() => _RegisterdAnimationState();
}

class _RegisterdAnimationState extends State<HoldOnAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _lottieAnimationController;

  @override
  void initState() {
    super.initState();

    _lottieAnimationController = AnimationController(
      vsync: this,
    );

    _lottieAnimationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        widget.whenItEnds();
      }
    });
  }

  @override
  void dispose() {
    _lottieAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          widget.animationDirectory,
          repeat: false,
          onLoaded: (composition) {
            _lottieAnimationController.duration = composition.duration;
            _lottieAnimationController.forward();
          },
        ),
      ),
    );
  }
}
