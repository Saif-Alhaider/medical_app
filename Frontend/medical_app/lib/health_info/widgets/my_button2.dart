
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  String text;
  Color bgColor;
  Color texColol;
  void Function()? Myontap;
  double borderRadius;
  MyButton2({
    Key? key,
    required this.text,
    required this.Myontap,
    required this.borderRadius,
    required this.bgColor,
    required this.texColol
  }) : super(key: key);
  int num1=0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:Myontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,

        ),
        child:  Center(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: texColol,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
