import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final TextAlign textAlign;
  const SubText({
    Key? key,
    this.size = 22.0,
    required this.text,
    this.color = const Color(0xff929BA1),
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.vazirmatn(
          fontSize: size, fontWeight: FontWeight.w400, color: color),
      // overflow: TextOverflow.ellipsis,
    );
  }
}
