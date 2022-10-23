import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:medical_app/main_colors.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/headline_text.dart';

import '../../../../Home/constants.dart';
import '../../../../../main.dart';
import '../../../../prescription/prescription_main.dart';
import '../../../../reuseable_widgets/texts_types/sub_text.dart';

class ReceiptSection extends StatelessWidget {
  const ReceiptSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IsDark? MainDarkColors.bgColor:MainLiteColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
           HeadLineText(
            text: "الراجيتات",
            lineHeight: 1,
            color: IsDark? MainDarkColors.primaryFontColor:MainLiteColors.primaryFontColor,
          ),
          for(var i=0;i<2;i++) ConstantValues.cardsGap,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrescriptionMain(),)),
                  child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.maxFinite,
                          height: 120,
                          decoration: BoxDecoration(
                              color: MainLiteColors.backgroundBlue,
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
                                child: const Icon(
                                  FontAwesome5.stethoscope,
                                  size: 45,
                                  color: MainLiteColors.foreignBlue,
                                ),
                              ),
                              ConstantValues.cardsGap,
                               const Expanded(
                                  child: SubText(
                                text: "ارسلت لك الدكتورة نادية راجيتة",
                                color: Colors.black,
                                textAlign: TextAlign.right,
                              ))
                            ],
                          ),
                        ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
