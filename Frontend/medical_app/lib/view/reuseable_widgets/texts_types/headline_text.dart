import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadLineText extends StatelessWidget {
  final double size;
  final Color color;
  final String text;
  final double lineHeight;
  final FontWeight fontWeight;
  const HeadLineText({
    Key? key,
    this.size = 24.0,
    this.color = Colors.black,
    required this.text,
    this.lineHeight = 3,
     this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.vazirmatn(fontSize: size,fontWeight: fontWeight,color: color,height: lineHeight),);
  }
}
