import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../reuseable_widgets/texts_types/sub_text.dart';

class GenderCard extends StatelessWidget {
  final SvgPicture svgPictur;
  final Color color;
  final String title;
  bool flag;
  GenderCard({
    Key? key,
    required this.svgPictur,
    required this.color,
    required this.title,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 220,
      height: 135,
      padding: const EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          svgPictur,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SubText(
                text: title,
                color: Colors.white,
                size: 25,
              ),
              flag
                  ? Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset("Assets/svg/done.svg"),
                    )
                  : Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.white,
                          border: Border.all(color: Colors.white, width: 3)),
                    ),
            ],
          ),
          
        ],
      ),
    );
  }
}
