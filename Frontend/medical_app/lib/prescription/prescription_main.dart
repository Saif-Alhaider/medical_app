import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:medical_app/Home/constants.dart';
import 'package:medical_app/User_Page/textfield/registerTextField.dart';
import 'package:medical_app/reuseable_widgets/break_line.dart';
import 'package:medical_app/reuseable_widgets/dashedLine.dart';
import 'package:medical_app/reuseable_widgets/main_button.dart';
import 'package:medical_app/reuseable_widgets/texts_types/headline_text.dart';
import 'package:medical_app/reuseable_widgets/texts_types/sub_text.dart';

import '../User_Page/health_info_register_page/description_info.dart';
import '../reuseable_widgets/timeLine.dart';

class PrescriptionMain extends StatefulWidget {
  static final List<ExpansionItem> _items = <ExpansionItem>[
    ExpansionItem(
        header: "اموكسوسلين",
        body: SizedBox(
          width: double.maxFinite,
          height: 200,
          child: TimeLine(
            numOfTimes: 3,
            circleSize: 27,
            ballsGap: 35,
            infoList: [
              TimeLineInfo(
                  info: "بعد الغداء",
                  timeOfDay: const TimeOfDay(hour: 12, minute: 20)),
              TimeLineInfo(
                  info: "بعد العشاء",
                  timeOfDay: const TimeOfDay(hour: 20, minute: 20)),
              TimeLineInfo(
                  info: "", timeOfDay: const TimeOfDay(hour: 23, minute: 0)),
            ],
          ),
        )),
    ExpansionItem(
        header: "فلو اوت",
        body: SizedBox(
          width: double.maxFinite,
          height: 200,
          child: TimeLine(
            numOfTimes: 3,
            circleSize: 30,
            ballsGap: 35,
            infoList: [
              TimeLineInfo(
                  info: "بعد الغداء",
                  timeOfDay: const TimeOfDay(hour: 12, minute: 20)),
              TimeLineInfo(
                  info: "بعد العشاء",
                  timeOfDay: const TimeOfDay(hour: 20, minute: 20)),
              TimeLineInfo(
                  info: "", timeOfDay: const TimeOfDay(hour: 23, minute: 0)),
            ],
          ),
        )),
    ExpansionItem(
        header: "براسيتول",
        body: SizedBox(
          width: double.maxFinite,
          height: 200,
          child: TimeLine(
            numOfTimes: 3,
            circleSize: 30,
            ballsGap: 35,
            infoList: [
              TimeLineInfo(
                  info: "بعد الغداء",
                  timeOfDay: const TimeOfDay(hour: 12, minute: 20)),
              TimeLineInfo(
                  info: "بعد العشاء",
                  timeOfDay: const TimeOfDay(hour: 20, minute: 20)),
              TimeLineInfo(
                  info: "", timeOfDay: const TimeOfDay(hour: 23, minute: 0)),
            ],
          ),
        )),
  ];
  const PrescriptionMain({super.key});

  @override
  State<PrescriptionMain> createState() => _PrescriptionMainState();
}

class _PrescriptionMainState extends State<PrescriptionMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: ConstantValues.cardShadow,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HeadLineText(
                                  text: "الراجيتة",
                                  lineHeight: 1,
                                  size: 35,
                                  color: Colors.black,
                                ),
                                LottieBuilder.asset(
                                  "Assets/Lottie json/receipt.json",
                                  height: 100,
                                  repeat: false,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 200,
                              child: Breakline(
                                color: Color(0xff9D9D9D),
                              ),
                            )
                          ],
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SubText(text: "العيادة"),
                                SubText(
                                  text: " ماء الحياة",
                                  color: Colors.black,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SubText(text: "الدكتور"),
                                SubText(
                                  text: "محمد الموسوي",
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        const HeadLineText(
                          text: "الادوية",
                        ),
                        ExpansionPanelList(
                          elevation: 0,
                          dividerColor: Colors.transparent,
                          expansionCallback: (panelIndex, isExpanded) {
                            PrescriptionMain._items[panelIndex].isExpanded =
                                !PrescriptionMain._items[panelIndex].isExpanded;
                            setState(() {});
                          },
                          children:
                              PrescriptionMain._items.map((ExpansionItem item) {
                            return ExpansionPanel(
                                backgroundColor: Colors.transparent,
                                body: item.body!,
                                headerBuilder: (context, isExpanded) {
                                  return Row(
                                    children: [
                                      const SubText(
                                        text: "3x",
                                        color: Colors.black,
                                      ),
                                      ConstantValues.cardsGap,
                                      SubText(
                                        text: item.header!,
                                        color: Colors.black,
                                      ),
                                    ],
                                  );
                                },
                                isExpanded: item.isExpanded);
                          }).toList(),
                        ),
                        DashedLine(),
                        const HeadLineText(text: "ملاحظات"),
                        DescriptionInfo(
                          controller: TextEditingController(),
                        ),
                        ConstantValues.cardsGap,
                        ConstantValues.cardsGap,
                        DashedLine(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 190,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadLineText(text: "رمز ال QR"),
                                  SizedBox(
                                      width: double.maxFinite,
                                      height: 50,
                                      child: MainButton(
                                        onPressed: () {},
                                        buttonTitle: "توليد رمز QR",
                                      )),
                                  ConstantValues.cardsGap,
                                  SizedBox(
                                      width: double.maxFinite,
                                      height: 50,
                                      child: MainButton(
                                        onPressed: () {},
                                        buttonTitle: "حفظ الرمز",
                                        buttonColor: Colors.transparent,
                                        titleColor: Color(0xff9d9d9d),
                                        stroke: true,
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Lottie.asset('Assets/Lottie json/qr-code-scanner.json',height: 200),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ConstantValues.cardsGap,
                  MainButton(onPressed: () {}, buttonTitle: 'حفظ الراجيتة')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpansionItem {
  bool isExpanded;
  String? header;
  Widget? body;
  ExpansionItem({
    this.isExpanded = false,
    this.header,
    this.body,
  });
}
