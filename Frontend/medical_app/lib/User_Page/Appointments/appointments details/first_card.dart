import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../Home/constants.dart';
import '../../../reuseable_widgets/break_line.dart';
import '../../../reuseable_widgets/texts_types/headline_text.dart';
import '../../../reuseable_widgets/texts_types/sub_text.dart';

class FirstCard extends StatelessWidget {
  final String clinic;
  final String doctorName;
  final String doctorSpeciality;
  final String date;
  final String doctorImage;
  const FirstCard({
    Key? key,
    required this.clinic,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.date,
    required this.doctorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatedDate = DateFormat('M').format(DateTime.parse(date).toLocal());
    var formatedDay = DateFormat('EEE').format(DateTime.parse(date).toLocal());
    var formatedTime =
        TimeOfDay.fromDateTime(DateTime.parse(date).toLocal()).format(context);
    print(doctorImage);
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Colors.white,
          
          boxShadow: ConstantValues.cardShadow,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // date
                  Column(
                    children: [
                      Text(
                        formatedDate,
                        style: GoogleFonts.rubik(
                            color: Color(0xffBE4330), fontSize: 22),
                      ),
                      SubText(
                        text: formatedDay,
                        color: Colors.black,
                      ),
                       SubText(text: formatedTime),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0, bottom: 0, right: 15),
                    child: Container(
                      width: 2,
                      color: Color(0xff9d9d9d),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://10.0.2.2:8000/images/$doctorImage"),
                          radius: 35,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadLineText(
                              text: doctorName,
                              color: Colors.blue,
                              size: 20,
                              lineHeight: 1,
                            ),
                            SubText(text: doctorSpeciality)
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Breakline(
              color: Color(0xff9d9d9d),
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubText(
                  text: "العيادة",
                  size: 18,
                ),
                SubText(
                  text: clinic,
                  color: Colors.blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
