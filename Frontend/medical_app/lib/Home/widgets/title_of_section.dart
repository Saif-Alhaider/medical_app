import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TItalOfSection extends StatelessWidget {
  TItalOfSection({Key? key, required this.mainText,  this.secondText=''}) : super(key: key);
  String mainText;
  String secondText;
  final Color primaryTextColor = Colors.black;
  final Color seconderyTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){},
            child: Text(
              secondText,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: seconderyTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            mainText,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
