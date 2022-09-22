import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';

import '../../reuseable_widgets/texts_types/headline_text.dart';
import '../../reuseable_widgets/texts_types/sub_text.dart';

class Specialities extends StatelessWidget {
  const Specialities({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> specialities = [
      {
        'speciality': 'اسنان',
        'iconData': FontAwesome5.tooth,
        'color': const Color.fromARGB(230, 255, 72, 75)
      },
      {
        'speciality': 'قلب',
        'iconData': FontAwesome5.heart,
        'color': const Color(0xffFE7F44),
      },
      {
        'speciality': 'تغذية',
        'iconData': Icons.emoji_food_beverage_rounded,
        'color': const Color.fromARGB(186, 76, 175, 79),
      },
      {
        'speciality': 'جلدية',
        'iconData': FontAwesome5.water,
        'color': const Color.fromARGB(186, 76, 175, 79),
      },{
        'speciality': 'باطنية',
        'iconData': Meteocons.clouds,
        'color': const Color.fromARGB(230, 255, 72, 75),
      },
    ];
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadLineText(text: 'الاختصاصات'),
              SizedBox(
                height: 108,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: specialities.length,
            itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 96,
                  height: 108,
                  decoration: BoxDecoration(
                    color: specialities[index]['color'],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        specialities[index]['iconData'],
                        size: 56,
                        color: Colors.white,
                      ),
                      SubText(
                        text: specialities[index]['speciality'],
                        color: Colors.white,
                      )
                    ],
                  ),
                );
            },
          ),
              )
            ],
          );
  }
}