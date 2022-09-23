import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class MedicinesListView extends StatelessWidget {
  const MedicinesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadLineText(
          text: "الادوية",
          color: Colors.blue,
          size: 35,
        ),
        Container(
          height: 180,
          width: double.maxFinite,
          decoration: const BoxDecoration(),
          child: ListView.builder(
            clipBehavior: Clip.none,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(56, 0, 0, 0),
                        offset: Offset(2, 4),
                        blurRadius: 8),
                    BoxShadow(
                        color: Color.fromARGB(255, 229, 228, 228),
                        offset: Offset(-2, -4),
                        blurRadius: 8),
                  ],
                ),
                width: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      child: SvgPicture.asset(
                        'Assets/svg/pills.svg',
                        height: 100,
                      ),
                    ),
                    ConstantValues.cardsGap,
                    SubText(text: "اموكسوسلين",color: Colors.black,)
                  ],
                ),
              );
            },
          ),
        ),
        
        ConstantValues.cardsGap,
        ConstantValues.cardsGap,
        ConstantValues.cardsGap,
        ConstantValues.cardsGap,
      ],
    );
  }
}
