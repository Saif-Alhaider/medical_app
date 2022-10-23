import 'package:flutter/material.dart';

import '../reuseable_widgets/texts_types/headline_text.dart';

class IndicatorsButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color textColor;
  final Color buttonColor;
  const IndicatorsButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.textColor = const Color(0xff2196F3),
    this.buttonColor = const Color(0xff2196F3),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: buttonColor
      ),
      child: TextButton(
                      onPressed: onPressed,
                      child: HeadLineText(
                        text: title,
                        lineHeight: 1,
                        color: textColor,
                        size: 24,
                      ),
                    ),
    );
  }
}
