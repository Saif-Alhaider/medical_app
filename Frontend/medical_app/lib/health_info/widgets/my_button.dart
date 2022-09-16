
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  double height;
  double width;
  String text;
  void Function()? Myontap;
  double borderRadius;
  MyButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.Myontap,
    required this.borderRadius
  }) : super(key: key);
int num1=0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:Myontap,
      child: Container(
        width: width,
        height:height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:  Center(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
