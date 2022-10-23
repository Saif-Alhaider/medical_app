
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/doctors_catogary/card_catogary_model.dart';
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
        // height: 80,
        width: 110,
        decoration: BoxDecoration(
            color: myCatogary.Bgcolor,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    style: GoogleFonts.vazirmatn(color: primaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}