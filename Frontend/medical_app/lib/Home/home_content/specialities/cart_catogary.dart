
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../models/doctors_catogary/card_catogary_model.dart';
class CartCatogary extends StatelessWidget {
  final Color primaryTextColor = Colors.black;
  Catogary myCatogary;
   CartCatogary({
     required this.myCatogary,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 8,bottom: 16,top: 16),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: myCatogary.Bgcolor,
            borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: (){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(myCatogary.icon,color: myCatogary.IconsColor,height: myCatogary.IconSize,),
              Flexible(
                child: Text(
                  myCatogary.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}