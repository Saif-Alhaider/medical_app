import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../../main.dart';
import '../../main_colors.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});
  final List notifications = [
    {
      "notificationColor": Color(0xffFED8D6),
      "notificationIcon": Icons.receipt,
      "iconColor": Color(0xffF6736A)
    },
    {
      "notificationColor": Color(0xffE8F3DC),
      "notificationIcon": FontAwesome5.stethoscope,
      "iconColor": Color(0xffBBDC94)
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IsDark?MainDarkColors.bgColor:MainLiteColors.bgColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_forward_ios,color: IsDark? MainDarkColors.primaryFontColor:MainLiteColors.primaryFontColor,)),
                  ),
                HeadLineText(text: "الاشعارات",color: IsDark? MainDarkColors.primaryFontColor:MainLiteColors.primaryFontColor,),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.maxFinite,
                        height: 120,
                        decoration: BoxDecoration(
                            color: notifications[index]['notificationColor'],
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: double.maxFinite,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(
                                notifications[index]['notificationIcon'],
                                size: 45,
                                color: notifications[index]['iconColor'],
                              ),
                            ),
                            ConstantValues.cardsGap,
                            const Expanded(
                                child: SubText(
                              text: "لقد وافق الدكتور محمد علي موسى على الحجز",
                              color: Colors.black,
                              textAlign: TextAlign.right,
                            ))
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
