import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';

import '../Main_View/main_view.dart';
import 'hold_on_animation.dart';

class MainButton extends StatelessWidget {
  final Color buttonColor;
  final Function() onPressed;
  final String buttonTitle;
  final Color titleColor;
  final bool stroke;
  const MainButton({
    Key? key,
    this.buttonColor = Colors.blue,
    required this.onPressed,
    required this.buttonTitle,
    this.titleColor = Colors.white,
     this.stroke = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: buttonColor,
        border: stroke ? Border.all(color: Colors.grey,width: 2):null
      ),
      child: TextButton(
        onPressed: onPressed,
        child: HeadLineText(
          text: buttonTitle,
          lineHeight: 1,
          color: titleColor,
          size: 24,
        ),
      ),
    );
  }
}
