import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medical_app/view/Home/constants.dart';
import 'package:medical_app/view/reuseable_widgets/texts_types/sub_text.dart';

class TimeLine extends StatelessWidget {
  final int numOfTimes;
  final double circleSize;
  final double ballsGap;
  final List<TimeLineInfo> infoList;
  const TimeLine({
    Key? key,
    required this.numOfTimes,
    required this.circleSize,
    required this.ballsGap,
    required this.infoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                width: circleSize*3,
                child: SubText(
                  text: infoList[0].timeOfDay.format(context),
                  color: Colors.black,
                  size: circleSize * 0.67,
                )),
            ConstantValues.cardsGap,
            Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
            ),
            ConstantValues.cardsGap,
            SizedBox(
                width: circleSize *3,
                child: SubText(
                  size: circleSize * 0.67,
                  text: infoList[0].info,
                  color: Colors.black,
                )),
          ],
        ),
        for (var i = 1; i < numOfTimes; i++) ...[
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: circleSize *3,
                child: SubText(
                  size: circleSize * 0.67,
                  text: infoList[i].timeOfDay.format(context),
                  color: Colors.black,
                ),
              ),
              ConstantValues.cardsGap,
              Column(
                children: [
                  // line
                  Container(
                    width: 5,
                    height: ballsGap,
                    color: Colors.blue,
                  ),
                  // ball
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                ],
              ),
              ConstantValues.cardsGap,
              SizedBox(
                width: circleSize *3,
                child: SubText(
                  size: circleSize * 0.67,
                  text: infoList[i].info,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ]
      ],
    );
  }
}


class TimeLineInfo {
  TimeOfDay timeOfDay;
  String info;

  TimeLineInfo({
    required this.timeOfDay,
    required this.info,
  });
}
