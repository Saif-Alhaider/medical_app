import 'package:flutter/material.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

class SecondCard extends StatelessWidget {
  const SecondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: Color(0xff9d9d9d),
          // ),
          boxShadow: ConstantValues.cardShadow,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: const [
                Icon(Icons.calendar_today_rounded,size: 30,),
                ConstantValues.cardsGap,
                SubText(text: "اضافة الى التقويم",color: Colors.black,)
              ],
            ),
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15),
            child:  Breakline(
              color: Color(0xff9d9d9d),
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: const [
                Icon(Icons.close,size: 30,),
                ConstantValues.cardsGap,
                SubText(text: "الغاء الحجز",color: Colors.black,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
